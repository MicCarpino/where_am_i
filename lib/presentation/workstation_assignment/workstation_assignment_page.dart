import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/core/utils/extensions.dart';
import 'package:where_am_i/domain/blocs/date_picker/date_picker_cubit.dart';
import 'package:where_am_i/domain/blocs/workstation/actor/workstation_actor_bloc.dart';
import 'package:where_am_i/domain/blocs/workstation/watcher/workstation_watcher_bloc.dart';
import 'package:where_am_i/domain/blocs/workstation/assignment/workstation_assignment_bloc.dart';
import 'package:where_am_i/domain/blocs/workstation/multiple_assignment/workstation_multiple_assignment_cubit.dart';
import 'package:where_am_i/domain/entities/user_with_workstation.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/domain/repositories/workstation_repository.dart';
import 'package:where_am_i/injection_container.dart';
import 'package:where_am_i/presentation/core/centered_loading.dart';
import 'package:where_am_i/presentation/core/custom_expansion_tile.dart';
import 'package:where_am_i/presentation/core/retry_widget.dart';
import 'package:where_am_i/presentation/workstation_assignment/presences_checklist.dart';

class WorkstationAssignmentPage extends StatelessWidget {
  WorkstationAssignmentPage({@required this.selectedWorkstationCode});

  final int selectedWorkstationCode;

  final ValueNotifier<Key> _expanded = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WorkstationAssignmentBloc>(
      create: (context) => WorkstationAssignmentBloc(
        workstationCode: selectedWorkstationCode,
        workstationWatcherBloc: context.read<WorkstationWatcherBloc>(),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: dncBlue,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body:
            BlocBuilder<WorkstationAssignmentBloc, WorkstationAssignmentState>(
          builder: (context, state) => state.maybeMap(
            orElse: () => Container(),
            loadSuccess: (value) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (value.assignedResources.isNotEmpty)
                      ..._buildOccupantsList(context, value.assignedResources),
                    if (value.assignableResources.isEmpty)
                      Expanded(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'Al momento nessuna risorsa può essere assegnata a questa postazione',
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      )
                    else
                      ..._buildAssignableResourcesList(
                          context, value.assignableResources)
                  ]);
            },
          ),
        ),
      ),
    );
  }

  List<Widget> _buildOccupantsList(
    BuildContext context,
    List<UserWithWorkstation> occupants,
  ) {
    occupants.sort((a, b) {
      var aStartTime = a.workstation.startTime.toDouble();
      var bStartTime = b.workstation.startTime.toDouble();
      var aEndTime = a.workstation.startTime.toDouble();
      var bEndTime = b.workstation.startTime.toDouble();
      var abc = aStartTime.compareTo(bStartTime);
      return abc != 0 ? abc : aEndTime.compareTo(bEndTime);
    });
    return [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Risorse assegnate alla postazione:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      ...occupants.map<Widget>((e) {
        String startTime = e.workstation.startTime.format(context);
        String endTime = e.workstation.endTime.format(context);
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: AutoSizeText(
                  '$startTime - $endTime ${e.getResourceLabel()}',
                  maxLines: 1,
                  minFontSize: 14,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.fade,
                  softWrap: false,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.highlight_remove),
              onPressed: () => context.read<WorkstationActorBloc>().add(
                    WorkstationActorEvent.update(
                      e.workstation.setWorkstationCode(null),
                    ),
                  ),
              color: Colors.grey,
            )
          ],
        );
      }),
      Divider(),
    ];
  }

  List<Widget> _buildAssignableResourcesList(
    BuildContext context,
    List<UserWithWorkstation> assignableUsers,
  ) {
    return [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Risorse assegnabili alla postazione:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      Expanded(
        child: ListView(
          shrinkWrap: true,
          children: assignableUsers
              .map((e) => e.workstation.hasMoreForCurrentMonth
                  ? _buildExpandableListTile(context, e)
                  : _buildSimpleListTile(context, e))
              .toList(),
        ),
      ),
    ];
  }

  Widget _buildSimpleListTile(
    BuildContext context,
    UserWithWorkstation userWithWorkstation,
  ) {
    return ListTile(
      title: Text(userWithWorkstation.getResourceLabel()),
      subtitle: _buildSlotTimeLabel(context, userWithWorkstation.workstation),
      onTap: () => context.read<WorkstationActorBloc>().add(
            WorkstationActorEvent.update(
              userWithWorkstation.workstation
                  .setWorkstationCode(selectedWorkstationCode.toString()),
            ),
          ),
    );
  }

  Widget _buildExpandableListTile(
    BuildContext context,
    UserWithWorkstation userWithWorkstation,
  ) {
    return BlocProvider<WorkstationMultipleAssignmentCubit>(
      create: (_) => WorkstationMultipleAssignmentCubit(
        workstationRepository: getIt<WorkstationRepository>(),
      ),
      child: Builder(
        builder: (newContext) => CustomExpansionTile(
          onHeaderClick: () {
            newContext.read<WorkstationActorBloc>().add(
                  WorkstationActorEvent.update(
                    userWithWorkstation.workstation
                        .setWorkstationCode(selectedWorkstationCode.toString()),
                  ),
                );
          },
          expansionCallback: (hasExpanded) {
            if (hasExpanded) {
              var date =
                  newContext.read<DatePickerCubit>().state.visualizedDate;
              newContext
                  .read<WorkstationMultipleAssignmentCubit>()
                  .fetchUserPresencesToEndOfMonth(
                      userWithWorkstation.user.idResource, date);
            }
          },
          subtitleWidget:
              _buildSlotTimeLabel(context, userWithWorkstation.workstation),
          expandedItem: _expanded,
          key: Key(userWithWorkstation.workstation.idWorkstation.toString()),
          title: Text(userWithWorkstation.getResourceLabel()),
          children: <Widget>[
            BlocBuilder<WorkstationMultipleAssignmentCubit,
                WorkstationMultipleAssignmentState>(
              builder: (aContext, state) => state.map(
                  loadingState: (value) => CenteredLoading(),
                  loadedState: (value) => PresencesChecklist(
                        codeWorkstation: selectedWorkstationCode,
                        presences: value.presences,
                      ),
                  errorState: (value) => RetryWidget(
                        onTryAgainPressed: () {
                          var date = newContext
                              .read<DatePickerCubit>()
                              .state
                              .visualizedDate;
                          context
                              .read<WorkstationMultipleAssignmentCubit>()
                              .fetchUserPresencesToEndOfMonth(
                                  userWithWorkstation.user.idResource, date);
                        },
                      )),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSlotTimeLabel(BuildContext context, Workstation workstation) {
    String startTime = workstation.startTime.format(context);
    String endTime = workstation.endTime.format(context);
    return Text(
      "$startTime - $endTime",
      style: TextStyle(color: Colors.black54, fontSize: 14),
    );
  }
}
