import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/core/utils/enums.dart';
import 'package:where_am_i/core/utils/extensions.dart';
import 'package:where_am_i/domain/repositories/user_repository.dart';
import 'package:where_am_i/domain/repositories/workstation_repository.dart';
import 'package:where_am_i/presentation/bloc/reservation/reservation_bloc.dart';
import 'package:where_am_i/presentation/bloc/workstation/actor/workstation_actor_bloc.dart';
import 'package:where_am_i/presentation/bloc/workstation/watcher/workstation_watcher_bloc.dart';
import 'package:where_am_i/presentation/bloc/workstation/workstation_bloc.dart';
import 'package:where_am_i/presentation/widgets/circular_loading.dart';
import 'package:where_am_i/presentation/widgets/date_picker.dart';
import 'package:where_am_i/presentation/widgets/reservations_calendar.dart';
import 'package:where_am_i/presentation/widgets/retry_widget.dart';
import 'package:where_am_i/presentation/widgets/room_24.dart';
import 'package:where_am_i/presentation/widgets/room_26A_F1.dart';
import 'package:where_am_i/presentation/widgets/room_26A_F2.dart';
import 'package:where_am_i/presentation/widgets/room_26B.dart';
import 'package:where_am_i/presentation/widgets/room_staff.dart';
import '../../injection_container.dart';

class WorkplacesPage extends StatefulWidget {
  WorkplacesPage(this.setTitle);

  final Function(String) setTitle;

  @override
  _WorkplacesPageState createState() => _WorkplacesPageState();
}

class _WorkplacesPageState extends State<WorkplacesPage> {
  DateTime _visualizedDate;

  @override
  void initState() {
    super.initState();
    _visualizedDate = DateTime.now().zeroed();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<WorkstationBloc>()),
        BlocProvider<ReservationsBloc>(
            create: (_) => getIt<ReservationsBloc>()
              ..add(FetchReservationsList(dateToFetch: _visualizedDate))),
        BlocProvider<WorkstationActorBloc>(
            create: (context) => WorkstationActorBloc(
                workstationRepository: getIt<WorkstationRepository>())),
        BlocProvider<WorkstationWatcherBloc>(
          create: (context) => WorkstationWatcherBloc(
            workstationRepository: getIt<WorkstationRepository>(),
            userRepository: getIt<UserRepository>(),
            workstationActorBloc: context.read<WorkstationActorBloc>(),
          )..add(WorkstationWatcherEvent.fetchWorkstations(_visualizedDate)),
        ),
      ],
      child: Builder(
        builder: (newContext) => Column(
          children: [
            DatePicker((newDate) {
              setState(() => this._visualizedDate = newDate);
              newContext
                  .read<WorkstationWatcherBloc>()
                  .add(WorkstationWatcherEvent.fetchWorkstations(newDate));
              newContext
                  .read<ReservationsBloc>()
                  .add(FetchReservationsList(dateToFetch: newDate));
            }),
            Expanded(
              child: PageView.builder(
                itemCount: Rooms.values.length,
                itemBuilder: (_, index) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        _buildWorkstationsSection(index),
                        if (Rooms.values[index].reservationRoomId != null)
                          _buildReservationsSection(index)
                      ],
                    ),
                  );
                },
                onPageChanged: (pageIndex) {
                  widget.setTitle(Rooms.values[pageIndex].roomTitle);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildWorkstationsSection(int index) {
    return BlocBuilder<WorkstationWatcherBloc, WorkstationWatcherState>(
      builder: (_, state) {
        return state.map(
          initial: (_) => Container(),
          loadInProgress: (_) => CircularLoading(),
          loadSuccess: (value) {
            switch (Rooms.values[index]) {
              case Rooms.room_26B:
                return Room26B();
              case Rooms.room_24:
                return Room24();
              case Rooms.room_26A_Floor1:
                return Room26AF1();
              case Rooms.room_26A_Floor2:
                return Room26AF2();
              case Rooms.room_staff:
                return RoomStaff();
              default:
                return Container();
            }
          },
          loadFailure: (_) => RetryWidget(
            onTryAgainPressed: () => context.read<WorkstationWatcherBloc>().add(
                  WorkstationWatcherEvent.fetchWorkstations(_visualizedDate),
                ),
          ),
        );
      },
    );
  }

  Widget _buildReservationsSection(int index) {
    return BlocBuilder<ReservationsBloc, ReservationState>(
      builder: (_, state) {
        if (state is ReservationsFetchLoadingState) {
          return CircularLoading();
        } else if (state is ReservationsFetchCompletedState) {
          return ReservationsCalendar(
            reservationsList: state.reservationsList
                .where((reservation) =>
                    reservation.idRoom == Rooms.values[index].reservationRoomId)
                .toList(),
            allowChangesForCurrentDate: true,
          );
        } else {
          return Center(
              child: RetryWidget(
            onTryAgainPressed: () => context
                .read<ReservationsBloc>()
                .add(FetchReservationsList(dateToFetch: _visualizedDate)),
          ));
        }
      },
    );
  }
}
