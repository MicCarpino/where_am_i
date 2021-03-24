import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/core/utils/enums.dart';
import 'package:where_am_i/core/utils/extensions.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/repositories/user_repository.dart';
import 'package:where_am_i/domain/repositories/workstation_repository.dart';
import 'package:where_am_i/presentation/bloc/date_picker/date_picker_cubit.dart';
import 'package:where_am_i/presentation/bloc/presences_management/actor/presences_management_actor_bloc.dart';
import 'package:where_am_i/presentation/bloc/presences_management/watcher/presences_management_watcher_bloc.dart';
import 'package:where_am_i/presentation/widgets/date_picker.dart';
import 'package:where_am_i/presentation/widgets/dialogs/time_slot_dialog.dart';
import 'package:where_am_i/presentation/widgets/retry_widget.dart';
import 'package:where_am_i/presentation/widgets/users_presences_list_widget.dart';
import '../../injection_container.dart';

class PresencesManagementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PresencesManagementActorBloc>(
          create: (context) => PresencesManagementActorBloc(
            getIt<WorkstationRepository>(),
          ),
        ),
        BlocProvider<PresencesManagementWatcherBloc>(
          create: (context) => PresencesManagementWatcherBloc(
            getIt<WorkstationRepository>(),
            getIt<UserRepository>(),
            context.read<PresencesManagementActorBloc>(),
          ),
        ),
        BlocProvider<DatePickerCubit>(create: (context) => DatePickerCubit()),
      ],
      child: BlocListener<PresencesManagementActorBloc,
          PresencesManagementActorState>(
        listener: (context, state) {
          state.maybeMap(
              actionFailure: (f) => ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(f.failure.getErrorMessageFromFailure()),
                    ),
                  ),
              showTimeSlotDialog: (value) => showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return TimeSlotDialog(
                          selectedDate: value.date,
                          workstation: value.workstation,
                          user: value.user,
                        );
                      }).then((result) {
                    if (result != null &&
                        result is Map<TimeSlot, List<DateTime>>) {
                      _handleDialogResult(
                          context, result, value.workstation, value.user);
                    }
                  }),
              orElse: () {});
        },
        child: Column(
          children: [
            Builder(
              builder: (context) =>
                  DatePicker((newDate) => _onDateChanged(context, newDate)),
            ),
            BlocBuilder<PresencesManagementWatcherBloc,
                PresencesManagementWatcherState>(
              builder: (context, state) {
                return state.maybeMap(
                  initial: (_) => Container(),
                  loadInProgress: (_) => Expanded(
                      child: const Center(child: CircularProgressIndicator())),
                  loadFailure: (_) => Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Center(
                        child: RetryWidget(
                          onTryAgainPressed: () => context
                              .read<PresencesManagementWatcherBloc>()
                              .add(
                                PresencesManagementWatcherEvent
                                    .getAllUsersPresencesByDate(
                                  context
                                      .read<DatePickerCubit>()
                                      .state
                                      .visualizedDate,
                                ),
                              ),
                        ),
                      )),
                  // loadSuccess and filteredList state
                  orElse: () => UsersPresencesList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  _onDateChanged(BuildContext context, DateTime newDate) {
    context.read<PresencesManagementWatcherBloc>().add(
          PresencesManagementWatcherEvent.getAllUsersPresencesByDate(newDate),
        );
  }

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _handleDialogResult(
      BuildContext context,
      Map<TimeSlot, List<DateTime>> result,
      Workstation workstation,
      User user) {
    if (workstation == null) {
      final dates = result.values.first;
      context.read<PresencesManagementActorBloc>().add(
            dates.length > 1
                ? PresencesManagementActorEvent.addedMultiple(
                    timeSlot: result.keys.first,
                    dates: List.from(dates),
                    idResource: user.idResource,
                  )
                : PresencesManagementActorEvent.added(
                    timeSlot: result.keys.first,
                    date: dates.first,
                    idResource: user.idResource,
                  ),
          );
    } else {
      //edit case
      var selectedSlot = result.keys.first;
      context.read<PresencesManagementActorBloc>().add(
            PresencesManagementActorEvent.updated(workstation.copyWith(
              status: WORKSTATION_STATUS_CONFIRMED,
              startTime: selectedSlot.toStartTime(),
              endTime: selectedSlot.toEndTime(),
            )),
          );
    }
  }
}
