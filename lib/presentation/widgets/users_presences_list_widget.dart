import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/core/utils/enums.dart';
import 'package:where_am_i/domain/entities/user_with_workstation.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/presentation/bloc/presences_management/actor/presences_management_actor_bloc.dart';
import 'package:where_am_i/presentation/bloc/presences_management/watcher/presences_management_watcher_bloc.dart';
import 'package:where_am_i/presentation/widgets/presences_management_tile.dart';

class UsersPresencesList extends StatelessWidget {
  const UsersPresencesList(this.visualizedDate);

  final DateTime visualizedDate;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PresencesManagementWatcherBloc,
        PresencesManagementWatcherState>(
      builder: (context, state) {
        return state.maybeMap(
            loadSuccess: (value) {
              return Expanded(
                child: ListView(children: [
                  if (value.usersPending.isNotEmpty) ...[
                    Container(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        'DA GESTIRE',
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      ),
                    ),
                    ...value.usersPending
                        .map((e) => PresencesManagementTile(
                              userWithWorkstation: e,
                              onSingleClick: () => null,
                              onLongClick: () => null,
                              onStatusButtonClick: (newStatus) =>
                                  _onStatusButtonClick(
                                context,
                                e.workstation.copyWith(status: newStatus),
                              ),
                            ))
                        .toList(),
                    Divider(color: Colors.grey, indent: 8, endIndent: 8),
                  ],
                  if (value.usersConfirmed.isNotEmpty) ...[
                    Container(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        'PRESENTI',
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      ),
                    ),
                    ...value.usersConfirmed
                        .map((e) => PresencesManagementTile(
                              userWithWorkstation: e,
                              onSingleClick: () => _onResourceClick(context, e),
                              onLongClick: () =>
                                  _onResourceLongClick(context, e),
                            ))
                        .toList(),
                    Divider(color: Colors.grey, indent: 8, endIndent: 8),
                  ],
                  ...[
                    Container(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        'NON PRESENTI',
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      ),
                    ),
                    ...value.usersRefusedOrAbsent
                        .map((e) => PresencesManagementTile(
                              userWithWorkstation: e,
                              onSingleClick: () => _onResourceClick(context, e),
                              onLongClick: () =>
                                  _onResourceLongClick(context, e),
                            ))
                        .toList(),
                    Divider(color: Colors.grey, indent: 8, endIndent: 8),
                  ],
                ]),
              );
            },
            orElse: () => Container());
      },
    );
  }

  _onResourceClick(
      BuildContext context, UserWithWorkstation userWithWorkstation) {
    context.read<PresencesManagementActorBloc>().add(
          PresencesManagementActorEvent.editRequested(
            visualizedDate,
            userWithWorkstation.workstation,
            userWithWorkstation.user,
          ),
        );
  }

  _onResourceLongClick(
      BuildContext context, UserWithWorkstation userWithWorkstation) {
    context.read<PresencesManagementActorBloc>().add(
          userWithWorkstation.workstation != null
              ? PresencesManagementActorEvent.removed(
                  userWithWorkstation.workstation,
                )
              : PresencesManagementActorEvent.added(
                  timeSlot: TimeSlot.fullDay,
                  date: visualizedDate,
                  idResource: userWithWorkstation.user?.idResource,
                  freeName: userWithWorkstation.workstation?.freeName,
                ),
        );
  }

  _onStatusButtonClick(BuildContext context, Workstation workstation) {
    context.read<PresencesManagementActorBloc>().add(
          PresencesManagementActorEvent.updated(workstation),
        );
  }
}
