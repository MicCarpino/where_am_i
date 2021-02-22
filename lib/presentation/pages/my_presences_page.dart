import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/domain/repositories/workstation_repository.dart';
import 'package:where_am_i/presentation/bloc/my_presences/actor/my_presences_actor_bloc.dart';
import 'package:where_am_i/presentation/bloc/my_presences/watcher/my_presences_watcher_bloc.dart';
import 'package:where_am_i/presentation/widgets/retry_widget.dart';
import 'package:where_am_i/presentation/widgets/table_calendar_widget.dart';

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
            state.maybeMap(
                deleteFailure: (f) => showSnackbar(
                    context, f.failure.getErrorMessageFromFailure()),
                insertFailure: (f) => showSnackbar(
                    context, f.failure.getErrorMessageFromFailure()),
                updateFailure: (f) => showSnackbar(
                    context, f.failure.getErrorMessageFromFailure()),
                orElse: () {});
          },
          child: BlocBuilder<MyPresencesWatcherBloc, MyPresencesWatcherState>(
            builder: (context, state) {
              return state.map(
                initial: (_) => Container(),
                loadInProgress: (_) =>
                    const Center(child: CircularProgressIndicator()),
                loadSuccess: (state) {
                  return TableCalendarWidget(userPresences: state.presences);
                },
                loadFailure: (_) => Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Center(
                      child: RetryWidget(
                          onTryAgainPressed: () => context
                              .read<MyPresencesWatcherBloc>()
                              .add(MyPresencesWatcherEvent.getUserPresences())),
                    )),
              );
            },
          ),
        ));
  }

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
