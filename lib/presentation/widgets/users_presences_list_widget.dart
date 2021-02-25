import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/core/utils/enums.dart';
import 'package:where_am_i/domain/entities/user_with_workstation.dart';
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
                              onSingleClick: () => _onResourceClick(context, e),
                              onLongClick: () => _onResourceLongClick,
                              onStatusButtonClick: (newStatusParams) => null,
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
                              onLongClick: () => _onResourceLongClick(context, e),
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
                              onLongClick: () => _onResourceLongClick(context,e),
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

/* _onUserLongClick(UserWithWorkstation userWithWorkstation) {
    if (userWithWorkstation.workstation?.status == 0) {
      return null;
    } else if (userWithWorkstation.workstation == null) {
      //inserting workstation for full day, already confirmed
      _presencesManagementBloc.add(OnPresenceAddedByManagement(
        PresenceNewParameters(
          date: this.visualizedDate,
          idResource: userWithWorkstation.user.idResource,
          startTime: TIME_SLOT_NINE,
          endTime: TIME_SLOT_EIGHTEEN,
        ),
      ));
    } else {
      userWithWorkstation.workstation.codeWorkstation == null
          ? _presencesManagementBloc.add(OnPresenceRemovedByManagement(
              userWithWorkstation.workstation.idWorkstation))
          : showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Attenzione"),
                  content: Text(
                      "La risorsa risulta già essere assegnata ad una postazione. Continuare?"),
                  actions: [
                    FlatButton(
                        child: Text("Annulla"),
                        onPressed: () => Navigator.pop(context)),
                    FlatButton(
                        child: Text("OK"),
                        onPressed: () {
                          _presencesManagementBloc.add(
                            OnPresenceRemovedByManagement(
                                userWithWorkstation.workstation.idWorkstation),
                          );
                          Navigator.pop(context);
                        })
                  ],
                );
              },
            );
      _textFieldController.clear();
    }
  }

  _onUserClick(UserWithWorkstation userWithWorkstation) {
    return userWithWorkstation?.workstation?.status !=
            WORKSTATION_STATUS_PENDING
        ? showDialog(
            context: context,
            builder: (BuildContext context) {
              return TimeSlotDialog(
                workstation: userWithWorkstation.workstation,
                selectedDate: this.visualizedDate,
                user: userWithWorkstation.user,
              );
            }).then((value) {
            //checking if callback result contains a value
            if (value != null && value is List<PresenceNewParameters>) {
              if (value.length == 1) {
                //presence already inserted, performing update
                _presencesManagementBloc.add(
                    userWithWorkstation.workstation != null
                        ? OnPresenceUpdatedByManagement(
                            userWithWorkstation.workstation, value.first)
                        : OnPresenceAddedByManagement(value.first));
              } else {
                _presencesManagementBloc
                    .add(OnMultiplePresencesAddedByManagement(value));
              }
            }
          })
        : null;
  }*/
}
