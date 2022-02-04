import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/core/utils/enums.dart';
import 'package:where_am_i/core/utils/extensions.dart';
import 'package:where_am_i/domain/blocs/date_picker/date_picker_cubit.dart';
import 'package:where_am_i/domain/blocs/presences_management/actor/presences_management_actor_bloc.dart';
import 'package:where_am_i/domain/blocs/presences_management/watcher/presences_management_watcher_bloc.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/repositories/user_repository.dart';
import 'package:where_am_i/domain/repositories/workstation_repository.dart';
import 'package:where_am_i/presentation/core/date_picker.dart';
import 'package:where_am_i/presentation/core/loading_overlay.dart';
import 'package:where_am_i/presentation/core/retry_widget.dart';
import 'package:where_am_i/presentation/core/time_slot_dialog.dart';
import 'package:where_am_i/presentation/presences_management/presences_management_list.dart';
import '../../injection_container.dart';
import '../responsive_builder.dart';

// the page where staff/admin can manage all resources presences
class PresencesManagementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //create new instances of bloc classes used in this section
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
          LoadingOverlay.dismissIfShowing(context);
          return state.maybeMap(
              //show the loading overlay when a presence action (api call) is in progress
              actionInProgress: (_) => LoadingOverlay.show(context),
              //show the error occurred when a presence action resulted failed
              actionFailure: (f) => ResponsiveBuilder.showsErrorMessage(
                  context, f.failure.getErrorMessageFromFailure()),
              //show the time slot selection dialog
              //this should be moved back on ui layer instead of int the bloc
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
            // date picker
            Builder(
              builder: (context) =>
                  DatePicker((newDate) => _onDateChanged(context, newDate)),
            ),
            BlocBuilder<PresencesManagementWatcherBloc,
                PresencesManagementWatcherState>(
              builder: (context, state) {
                return state.maybeMap(
                  initial: (_) => Container(),
                  //presences fetch in progress, show loading indicator
                  loadInProgress: (_) => Flexible(
                      child: const Center(child: CircularProgressIndicator())),
                  //presences fetch failed, show the retry button and define his callback
                  loadFailure: (_) => Flexible(
                      child: Center(
                    child: RetryWidget(
                      onTryAgainPressed: () =>
                          context.read<PresencesManagementWatcherBloc>().add(
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
                  // loadSuccess or filteredList state, show the resources/presences list
                  orElse: () => PresencesManagementList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  //callback for the date change in the date picker
  _onDateChanged(BuildContext context, DateTime newDate) {
    context.read<PresencesManagementWatcherBloc>().add(
          PresencesManagementWatcherEvent.getAllUsersPresencesByDate(newDate),
        );
  }

  void showSnackbar(BuildContext context, String message) {
    ResponsiveBuilder.showsErrorMessage(context, message);
  }

  // action on time slot dialog operation result
  void _handleDialogResult(
      BuildContext context,
      Map<TimeSlot, List<DateTime>> result,
      Workstation workstation,
      User user) {
    //no action has been performed on an existing workstation object, so it was
    // an insert operation
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
      //edit operation
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
