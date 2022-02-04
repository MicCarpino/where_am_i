import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/core/utils/enums.dart';
import 'package:where_am_i/core/utils/styles.dart';
import 'package:where_am_i/domain/blocs/authentication/authentication_bloc.dart';
import 'package:where_am_i/domain/blocs/date_picker/date_picker_cubit.dart';
import 'package:where_am_i/domain/blocs/home/home_cubit.dart';
import 'package:where_am_i/domain/blocs/reservation/form/reservation_form.dart';
import 'package:where_am_i/domain/blocs/workstation/actor/workstation_actor_bloc.dart';
import 'package:where_am_i/domain/blocs/workstation/watcher/workstation_watcher_bloc.dart';
import 'package:where_am_i/domain/blocs/reservation/watcher/reservation_watcher_bloc.dart';
import 'package:where_am_i/domain/blocs/reservation/actor/reservation_actor_bloc.dart';
import 'package:where_am_i/domain/blocs/reservation/form/reservation_form_bloc.dart';
import 'package:where_am_i/domain/repositories/reservation_repository.dart';
import 'package:where_am_i/domain/repositories/user_repository.dart';
import 'package:where_am_i/domain/repositories/workstation_repository.dart';
import 'package:where_am_i/presentation/core/centered_loading.dart';
import 'package:where_am_i/presentation/core/date_picker.dart';
import 'package:where_am_i/presentation/core/loading_overlay.dart';
import 'package:where_am_i/presentation/core/retry_widget.dart';
import 'package:where_am_i/presentation/home/reservations/form/reservation_form_page.dart';
import 'package:where_am_i/presentation/home/reservations/reservations_calendar.dart';
import 'package:where_am_i/presentation/home/workstations/room_24.dart';
import 'package:where_am_i/presentation/home/workstations/room_26A_F1.dart';
import 'package:where_am_i/presentation/home/workstations/room_26A_F2.dart';
import 'package:where_am_i/presentation/home/workstations/room_26B.dart';
import 'package:where_am_i/presentation/home/workstations/room_staff.dart';
import 'package:where_am_i/presentation/responsive_builder.dart';
import '../../injection_container.dart';

//The main page which holds the workspaces/workstations and reservation calendars
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _tabController = TabController(vsync: this, length: Rooms.values.length)
      ..addListener(() {
        _pageController.animateToPage(_tabController.index,
            duration: const Duration(milliseconds: 1),
            curve: Curves.decelerate);
      });
  }

  @override
  Widget build(BuildContext context) {
    //initialize Bloc used for workstations/reservations operations
    return MultiBlocProvider(
      providers: [
        //Reservations
        BlocProvider<ReservationActorBloc>(
            create: (context) => ReservationActorBloc(
                reservationRepository: getIt<ReservationRepository>())),
        BlocProvider<ReservationWatcherBloc>(
            create: (context) => ReservationWatcherBloc(
                reservationRepository: getIt<ReservationRepository>(),
                reservationActorBloc: context.read<ReservationActorBloc>())),
        //Workstations
        BlocProvider<WorkstationActorBloc>(
            create: (context) => WorkstationActorBloc(
                workstationRepository: getIt<WorkstationRepository>())),
        BlocProvider<WorkstationWatcherBloc>(
          create: (context) => WorkstationWatcherBloc(
            workstationRepository: getIt<WorkstationRepository>(),
            userRepository: getIt<UserRepository>(),
            workstationActorBloc: context.read<WorkstationActorBloc>(),
          ),
        ),
        BlocProvider<DatePickerCubit>(create: (context) => DatePickerCubit()),
      ],
      child: Builder(
        builder: (newContext) => MultiBlocListener(
          listeners: [
            BlocListener<WorkstationActorBloc, WorkstationActorState>(
              listener: (context, state) {
                LoadingOverlay.dismissIfShowing(context);
                return state.maybeMap(
                  //show the loading overlay when a workstation action (api call) is in progress
                  actionInProgress: (_) => LoadingOverlay.show(context),
                  //show the error occurred when a workstation action resulted in an error
                  actionFailure: (value) => ResponsiveBuilder.showsErrorMessage(
                      context, value.failure.getErrorMessageFromFailure()),
                  orElse: () {},
                );
              },
            ),
            BlocListener<ReservationActorBloc, ReservationActorState>(
              listener: (context, state) {
                LoadingOverlay.dismissIfShowing(context);
                return state.maybeMap(
                  //show the loading overlay when a reservation action (api call) is in progress
                  actionInProgress: (_) => LoadingOverlay.show(context),
                  //show the error occurred when a reservation action resulted in an error
                  actionFailure: (value) => ResponsiveBuilder.showsErrorMessage(
                      context, value.failure.getErrorMessageFromFailure()),
                  orElse: () {},
                );
              },
            )
          ],
          child: Column(
            children: [
              //if is not mobile layout show the tab bar on top with all workspaces options
              if (!ResponsiveBuilder.isMobile(context))
                Material(
                  color: dncBlue,
                  child: TabBar(
                    controller: _tabController,
                    tabs: Rooms.values
                        .map((e) => Tab(
                              child: AutoSizeText(
                                e.title,
                                wrapWords: false,
                                softWrap: true,
                              ),
                            ))
                        .toList(),
                    indicatorWeight: 2.5,
                    indicatorColor: Colors.white,
                    unselectedLabelColor: Colors.white,
                  ),
                ),
              DatePicker((newDate) {
                newContext
                    .read<WorkstationWatcherBloc>()
                    .add(WorkstationWatcherEvent.fetchPresences(newDate));
                newContext
                    .read<ReservationWatcherBloc>()
                    .add(ReservationWatcherEvent.fetchReservations(newDate));
              }),
              Expanded(
                //build the widget responsible for the "navigation" between the workspaces
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: Rooms.values.length,
                  itemBuilder: (_, index) {
                    //build workstations and reservations calendar
                    return SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.all(16),
                      //on mobile build first the workstation section and below
                      // the reservation calendar
                      child: ResponsiveBuilder(
                          mobile: Column(
                            children: [
                              _buildWorkstationsSection(
                                  context, Rooms.values[index]),
                              SizedBox(height: 16),
                              //if there's no "idRoom" for the current room it means
                              //there's no meeting room for the current workspace
                              if (Rooms.values[index].idRoom != null)
                                _buildReservationsSection(
                                    newContext, Rooms.values[index])
                            ],
                          ),
                          // on desktop build workstation and eventual calendar
                          // sections side by side
                          tabletOrDesktop: Flex(
                            direction: Axis.horizontal,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Flexible(
                                child: _buildWorkstationsSection(
                                    context, Rooms.values[index]),
                                flex: 3,
                              ),
                              if (Rooms.values[index].idRoom != null)
                                //if there's no "idRoom" for the current room it means
                                //there's no meeting room for the current workspace
                                Flexible(
                                  child: _buildReservationsSection(
                                      newContext, Rooms.values[index]),
                                  flex: 2,
                                )
                            ],
                          )),
                    );
                  },
                  // When the user slide or select a new workspace update the title
                  // in the Home cubit. Ideally the navigation logic should be moved
                  // there too
                  onPageChanged: (pageIndex) {
                    _tabController.index = pageIndex;
                    context
                        .read<HomeCubit>()
                        .changeTitle(Rooms.values[pageIndex]);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWorkstationsSection(BuildContext context, Rooms room) {
    switch (room) {
      case Rooms.room_26B:
        return Room26B();
      case Rooms.room_26A_Floor1:
        return Room26AF1();
      case Rooms.room_26A_Floor2:
        return Room26AF2();
      case Rooms.room_24:
        return Room24();
      case Rooms.room_staff:
        return RoomStaff();
      default:
        return Container();
    }
  }

  //build the reservation section depending on the reservation bloc state
  Widget _buildReservationsSection(BuildContext context, Rooms room) {
    return BlocBuilder<ReservationWatcherBloc, ReservationWatcherState>(
        builder: (_, state) => state.map(
              initial: (_) => Container(),
              // reservation fetch in progress, show loading indicator
              loadInProgress: (_) => CenteredLoading(),
              // reservations list fetched, build the "calendar"
              loadSuccess: (value) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: double.infinity,
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.spaceBetween,
                      children: [
                        Text(
                          room.reservationRoomTitle,
                          style: roomLabelStyle,
                          maxLines: 2,
                        ),
                        //show/hide the "add reservation" button
                        Visibility(
                          visible:
                              context.read<DatePickerCubit>().isEditAllowed(),
                          child: IconButton(
                            icon: Icon(
                              Icons.add_circle_sharp,
                              color: Colors.black54,
                              size: 26,
                            ),
                            //open the "new reservation page"
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                //provide blocs needed by the "new reservation" page
                                builder: (_) => MultiBlocProvider(
                                  providers: [
                                    BlocProvider.value(
                                      value: context.read<AuthenticationBloc>(),
                                    ),
                                    BlocProvider.value(
                                      value:
                                          context.read<ReservationActorBloc>(),
                                    ),
                                    BlocProvider.value(
                                      value: context.read<DatePickerCubit>(),
                                    ),
                                    BlocProvider<ReservationFormBloc>(
                                      create: (context) => ReservationFormBloc(
                                          reservationActorBloc: context
                                              .read<ReservationActorBloc>(),
                                          // initialize the form state with the current
                                          // date and the current logged user
                                          // (subject of the reservation)
                                          initialState: ReservationFormState(
                                            reservationForm:
                                                ReservationForm.initial(
                                                    room.idRoom,
                                                    context
                                                        .read<DatePickerCubit>()
                                                        .state
                                                        .visualizedDate,
                                                    int.tryParse(context
                                                        .read<
                                                            AuthenticationBloc>()
                                                        .state
                                                        .authenticatedUser
                                                        .user
                                                        .idResource)),
                                            isEditing: false,
                                            isSaving: false,
                                          )),
                                    ),
                                  ],
                                  child: ReservationFormPage(),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  //build the calendar for this workspace
                  ReservationsCalendar(
                    reservationsList: value.reservations
                        .where((element) => element.idRoom == room.idRoom)
                        .toList(),
                  ),
                ],
              ),
              // reservations fetch failed, show the retry button and define
              // the action to perform when clicked
              loadFailure: (value) => Center(
                  child: RetryWidget(
                      onTryAgainPressed: () =>
                          context.read<ReservationWatcherBloc>().add(
                                ReservationWatcherEvent.fetchReservations(
                                  context
                                      .read<DatePickerCubit>()
                                      .state
                                      .visualizedDate,
                                ),
                              ))),
            ));
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }
}
