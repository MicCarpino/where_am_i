import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/core/utils/enums.dart';
import 'package:where_am_i/domain/entities/user_with_workstation.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/presentation/bloc/date_picker/date_picker_cubit.dart';
import 'package:where_am_i/presentation/bloc/presences_management/actor/presences_management_actor_bloc.dart';
import 'package:where_am_i/presentation/bloc/presences_management/watcher/presences_management_watcher_bloc.dart';
import 'package:where_am_i/presentation/widgets/dialogs/add_external_user_dialog.dart';
import 'package:where_am_i/presentation/widgets/presences_management_tile.dart';

class UsersPresencesList extends StatefulWidget {
  @override
  _UsersPresencesListState createState() => _UsersPresencesListState();
}

class _UsersPresencesListState extends State<UsersPresencesList> {
  TextEditingController _textFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textFieldController.addListener(() {
      context.read<PresencesManagementWatcherBloc>().add(
            PresencesManagementWatcherEvent.onFilterUpdated(
                _textFieldController.text),
          );
    });
  }

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(children: [
      Row(children: [_buildSearchBar(), _buildAddExternalUserButton()]),
      BlocBuilder<PresencesManagementWatcherBloc,
          PresencesManagementWatcherState>(
        builder: (context, watcherState) {
          return watcherState.maybeMap(
              loadSuccess: (state) {
                return Expanded(
                  child: ListView(children: [
                    if (state.usersPending.isNotEmpty) ...[
                      Container(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          'DA GESTIRE',
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                        ),
                      ),
                      ...state.usersPending
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
                    if (state.usersConfirmed.isNotEmpty) ...[
                      Container(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          'PRESENTI',
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                        ),
                      ),
                      ...state.usersConfirmed
                          .map((e) => PresencesManagementTile(
                                userWithWorkstation: e,
                                onSingleClick: () =>
                                    _onResourceClick(context, e),
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
                      ...state.usersRefusedOrAbsent
                          .map((e) => PresencesManagementTile(
                                userWithWorkstation: e,
                                onSingleClick: () =>
                                    _onResourceClick(context, e),
                                onLongClick: () =>
                                    _onResourceLongClick(context, e),
                              ))
                          .toList(),
                      Divider(color: Colors.grey, indent: 8, endIndent: 8),
                    ],
                  ]),
                );
              },
              filteredList: (state) {
                return Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    separatorBuilder: (_, index) =>
                        Divider(color: Colors.black26),
                    itemBuilder: (_, index) => PresencesManagementTile(
                      userWithWorkstation: state.filteredPresences[index],
                      onSingleClick: () => _onResourceClick(
                          context, state.filteredPresences[index]),
                      onLongClick: () => _onResourceLongClick(
                          context, state.filteredPresences[index]),
                      onStatusButtonClick: (newStatus) {
                        _onStatusButtonClick(
                            context,
                            state.filteredPresences[index].workstation
                                .copyWith(status: newStatus));
                      },
                    ),
                    itemCount: state.filteredPresences.length,
                  ),
                );
              },
              orElse: () => Container());
        },
      )
    ]));
  }

  Widget _buildSearchBar() {
    return Expanded(
      child: TextField(
        controller: _textFieldController,
        maxLines: 1,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 14.0),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            prefixIcon: _textFieldController.text.isEmpty
                ? Icon(Icons.search, color: Colors.black)
                : IconButton(
                    icon: Icon(Icons.clear, color: Colors.black),
                    onPressed: () => _textFieldController.clear(),
                  )),
      ),
    );
  }

  Widget _buildAddExternalUserButton() {
    final isEditAllowed =
    BlocProvider.of<DatePickerCubit>(context).isEditAllowed();
    return IconButton(
      icon: Icon(Icons.person_add,
          color: isEditAllowed ? Colors.black87 : Colors.grey),
      onPressed: () => isEditAllowed
          ? showDialog(
              context: context,
              builder: (BuildContext _) {
                return BlocProvider.value(
                  value: context.read<PresencesManagementActorBloc>(),
                  child: AddExternalUserDialog(
                    messageText: "Aggiungi risorsa non presente in elenco",
                    date: context.read<DatePickerCubit>().state.visualizedDate,
                  ),
                );
              })
          : null,
    );
  }

  _onResourceClick(
      BuildContext context, UserWithWorkstation userWithWorkstation) {
    context.read<PresencesManagementActorBloc>().add(
          PresencesManagementActorEvent.editRequested(
            context.read<DatePickerCubit>().state.visualizedDate,
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
                  date: context.read<DatePickerCubit>().state.visualizedDate,
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
