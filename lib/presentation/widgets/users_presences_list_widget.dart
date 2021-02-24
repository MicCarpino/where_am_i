import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/domain/entities/user_with_workstation.dart';
import 'package:where_am_i/presentation/bloc/presences_management/actor/presences_management_actor_bloc.dart';
import 'package:where_am_i/presentation/bloc/presences_management/watcher/presences_management_watcher_bloc.dart';
import 'package:where_am_i/presentation/widgets/presences_management_tile.dart';

class UsersPresencesList extends StatelessWidget {
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
                    Text('da gestire'),
                    ...value.usersPending
                        .map((e) => PresencesManagementTile(
                              userWithWorkstation: e,
                              onLongClick: () => null,
                              onSingleClick: () => null,
                              onStatusButtonClick: (newStatusParams) => null,
                            ))
                        .toList()
                  ],
                  if (value.usersConfirmed.isNotEmpty) ...[
                    Text('confermati'),
                    ...value.usersConfirmed
                        .map((e) => PresencesManagementTile(
                              userWithWorkstation: e,
                              onLongClick: () => null,
                              onSingleClick: () => null,
                              onStatusButtonClick: (newStatusParams) => null,
                            ))
                        .toList()
                  ],
                  if (value.usersPending.isNotEmpty) ...[
                    Text('boh'),
                    ...value.usersRefusedOrAbsent
                        .map((e) => PresencesManagementTile(
                              userWithWorkstation: e,
                              onLongClick: () => null,
                              onSingleClick: () => null,
                              onStatusButtonClick: (newStatusParams) => null,
                            ))
                        .toList()
                  ],
                ]),
              );
            },
            orElse: () => Container());
      },
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
