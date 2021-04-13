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
              listener: (context, state) => state.maybeMap(
                orElse: () {},
                actionFailure: (value) => ResponsiveBuilder.showsErrorMessage(
                    context, value.failure.getErrorMessageFromFailure()),
              ),
            ),
            BlocListener<ReservationActorBloc, ReservationActorState>(
              listener: (context, state) => state.maybeMap(
                orElse: () {},
                actionFailure: (value) => ResponsiveBuilder.showsErrorMessage(
                    context, value.failure.getErrorMessageFromFailure()),
              ),
            )
          ],
          child: Column(
            children: [
              if (!ResponsiveBuilder.isMobile(context))
                Material(
                  color: dncBlue,
                  child: TabBar(
                    controller: _tabController,
                    tabs: Rooms.values.map((e) => Tab(text: e.title)).toList(),
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
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: Rooms.values.length,
                  itemBuilder: (_, index) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.all(16),
                      child: ResponsiveBuilder(
                          mobile: Column(
                            children: [
                              _buildWorkstationsSection(
                                  context, Rooms.values[index]),
                              SizedBox(height: 16),
                              if (Rooms.values[index].idRoom != null)
                                _buildReservationsSection(
                                    newContext, Rooms.values[index])
                            ],
                          ),
                          tabletOrDesktop: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Flexible(
                                child: _buildWorkstationsSection(
                                    context, Rooms.values[index]),
                                flex: 3,
                              ),
                              if (Rooms.values[index].idRoom != null)
                                Flexible(
                                  child: _buildReservationsSection(
                                      newContext, Rooms.values[index]),
                                  flex: 2,
                                )
                            ],
                          )),
                    );
                  },
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

  Widget _buildReservationsSection(BuildContext context, Rooms room) {
    return BlocBuilder<ReservationWatcherBloc, ReservationWatcherState>(
        builder: (_, state) => state.map(
              initial: (_) => Container(),
              loadInProgress: (_) => CenteredLoading(),
              loadSuccess: (value) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(room.reservationRoomTitle, style: roomLabelStyle),
                      Visibility(
                        visible:
                            context.read<DatePickerCubit>().isEditAllowed(),
                        child: IconButton(
                          icon: Icon(
                            Icons.add_circle_sharp,
                            color: Colors.black54,
                            size: 32,
                          ),
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => MultiBlocProvider(
                                providers: [
                                  BlocProvider.value(
                                    value: context.read<AuthenticationBloc>(),
                                  ),
                                  BlocProvider.value(
                                    value: context.read<ReservationActorBloc>(),
                                  ),
                                  BlocProvider.value(
                                    value: context.read<DatePickerCubit>(),
                                  ),
                                  BlocProvider<ReservationFormBloc>(
                                    create: (context) => ReservationFormBloc(
                                        reservationActorBloc: context
                                            .read<ReservationActorBloc>(),
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
                  ReservationsCalendar(
                    reservationsList: value.reservations
                        .where((element) => element.idRoom == room.idRoom)
                        .toList(),
                  ),
                ],
              ),
              loadFailure: (value) =>
                  Center(child: RetryWidget(onTryAgainPressed: () {
                final date =
                    context.read<DatePickerCubit>().state.visualizedDate;
                context
                    .read<ReservationWatcherBloc>()
                    .add(ReservationWatcherEvent.fetchReservations(date));
              })),
            ));
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }
}
