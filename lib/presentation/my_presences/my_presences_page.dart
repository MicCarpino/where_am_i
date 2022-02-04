import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/core/utils/enums.dart';
import 'package:where_am_i/core/utils/extensions.dart';
import 'package:where_am_i/domain/blocs/my_presences/actor/my_presences_actor_bloc.dart';
import 'package:where_am_i/domain/blocs/my_presences/watcher/my_presences_watcher_bloc.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/repositories/workstation_repository.dart';
import 'package:where_am_i/presentation/core/loading_overlay.dart';
import 'package:where_am_i/presentation/core/retry_widget.dart';
import 'package:where_am_i/presentation/core/time_slot_dialog.dart';
import 'package:where_am_i/presentation/my_presences/my_presences_calendar.dart';
import 'package:where_am_i/presentation/responsive_builder.dart';
import '../../injection_container.dart';

// the page where the logged user can manage his presences
class MyPresencesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //create new instances of bloc classes used in this section
    return MultiBlocProvider(
        providers: [
          BlocProvider<MyPresencesActorBloc>(
            create: (context) => MyPresencesActorBloc(
              getIt<WorkstationRepository>(),
            ),
          ),
          BlocProvider<MyPresencesWatcherBloc>(
            create: (context) => MyPresencesWatcherBloc(
              getIt<WorkstationRepository>(),
              context.read<MyPresencesActorBloc>(),
            ),
          ),
        ],
        child: BlocListener<MyPresencesActorBloc, MyPresencesActorState>(
          listener: (context, state) {
            LoadingOverlay.dismissIfShowing(context);
            return state.maybeMap(
                //show the loading overlay when a presence action (api call) is in progress
                actionInProgress: (_) => LoadingOverlay.show(context),
                //show the error occurred when a presence action fails
                deleteFailure: (f) => ResponsiveBuilder.showsErrorMessage(
                    context, f.failure.getErrorMessageFromFailure()),
                insertFailure: (f) => ResponsiveBuilder.showsErrorMessage(
                    context, f.failure.getErrorMessageFromFailure()),
                updateFailure: (f) => ResponsiveBuilder.showsErrorMessage(
                    context, f.failure.getErrorMessageFromFailure()),
                //show the time slot selection dialog
                //this should be moved back on ui layer instead of int the bloc
                showTimeSlotDialog: (value) => showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return TimeSlotDialog(
                            selectedDate: value.date,
                            workstation: value.workstation,
                          );
                        }).then((result) {
                      if (result != null &&
                          result is Map<TimeSlot, List<DateTime>>) {
                        _handleDialogResult(context, result, value.workstation);
                      }
                    }),
                orElse: () {});
          },
          child: BlocBuilder<MyPresencesWatcherBloc, MyPresencesWatcherState>(
            builder: (context, state) {
              return state.map(
                initial: (_) => Container(),
                //presences fetch in progress, show loading indicator
                loadInProgress: (_) =>
                    const Center(child: CircularProgressIndicator()),
                //presences fetch successful, build the 26B workstations
                loadSuccess: (state) => ResponsiveBuilder(
                    //on mobile show a full screen calendar
                    mobile: MyPresencesCalendar(userPresences: state.presences),
                    // on tablet/desktop/web show a resized version of the calendar
                    tabletOrDesktop: LayoutBuilder(
                      builder: (context, constraints) => Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(flex: 1, child: Container()),
                          Flexible(
                            flex: 3,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  MyPresencesCalendar(
                                    userPresences: state.presences,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Flexible(flex: 1, child: Container()),
                        ],
                      ),
                    )),
                //presences fetch failed, show the retry button and define his callback
                loadFailure: (_) => Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Center(
                      child: RetryWidget(
                        onTryAgainPressed: () => context
                            .read<MyPresencesWatcherBloc>()
                            .add(MyPresencesWatcherEvent.getUserPresences()),
                      ),
                    )),
              );
            },
          ),
        ));
  }

  // action on time slot dialog operation result
  void _handleDialogResult(BuildContext context,
      Map<TimeSlot, List<DateTime>> result, Workstation workstation) {
    //no action has been performed on an existing workstation object, so it was
    // an insert operation
    if (workstation == null) {
      final dates = result.values.first;
      context.read<MyPresencesActorBloc>().add(dates.length > 1
          ? MyPresencesActorEvent.addedMultiple(
              result.keys.first, List.from(dates))
          : MyPresencesActorEvent.added(result.keys.first, dates.first));
    } else {
      //edit operation
      var selectedSlot = result.keys.first;
      context.read<MyPresencesActorBloc>().add(MyPresencesActorEvent.updated(
            workstation.copyWith(
              startTime: selectedSlot.toStartTime(),
              endTime: selectedSlot.toEndTime(),
            ),
          ));
    }
  }
}
