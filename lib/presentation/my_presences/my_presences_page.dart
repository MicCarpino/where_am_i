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

class MyPresencesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                actionInProgress: (_) => LoadingOverlay.show(context),
                deleteFailure: (f) => ResponsiveBuilder.showsErrorMessage(
                    context, f.failure.getErrorMessageFromFailure()),
                insertFailure: (f) => ResponsiveBuilder.showsErrorMessage(
                    context, f.failure.getErrorMessageFromFailure()),
                updateFailure: (f) => ResponsiveBuilder.showsErrorMessage(
                    context, f.failure.getErrorMessageFromFailure()),
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
                loadInProgress: (_) =>
                    const Center(child: CircularProgressIndicator()),
                loadSuccess: (state) => ResponsiveBuilder(
                    mobile: MyPresencesCalendar(userPresences: state.presences),
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

  void _handleDialogResult(BuildContext context,
      Map<TimeSlot, List<DateTime>> result, Workstation workstation) {
    if (workstation == null) {
      final dates = result.values.first;
      context.read<MyPresencesActorBloc>().add(dates.length > 1
          ? MyPresencesActorEvent.addedMultiple(
              result.keys.first, List.from(dates))
          : MyPresencesActorEvent.added(result.keys.first, dates.first));
    } else {
      //edit case
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
