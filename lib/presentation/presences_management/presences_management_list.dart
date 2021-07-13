import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/core/utils/enums.dart';
import 'package:where_am_i/domain/blocs/date_picker/date_picker_cubit.dart';
import 'package:where_am_i/domain/blocs/presences_management/actor/presences_management_actor_bloc.dart';
import 'package:where_am_i/domain/blocs/presences_management/watcher/presences_management_watcher_bloc.dart';
import 'package:where_am_i/domain/entities/user_with_workstation.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/presentation/presences_management/add_external_user_dialog.dart';
import 'package:where_am_i/presentation/presences_management/presences_management_tile.dart';
import 'package:where_am_i/presentation/responsive_builder.dart';

class PresencesManagementList extends StatefulWidget {
  @override
  _PresencesManagementListState createState() =>
      _PresencesManagementListState();
}

class _PresencesManagementListState extends State<PresencesManagementList> {
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
                  child: ResponsiveBuilder(
                    mobile: ListView(
                      children: [
                        ..._buildUsersPendingSection(state.usersPending),
                        Divider(color: Colors.grey, indent: 8, endIndent: 8),
                        ..._buildUsersConfirmedSection(state.usersConfirmed),
                        Divider(color: Colors.grey, indent: 8, endIndent: 8),
                        ..._buildUsersRefusedOrAbsentSection(
                            state.usersRefusedOrAbsent),
                        Divider(color: Colors.grey, indent: 8, endIndent: 8),
                      ],
                    ),
                    tabletOrDesktop: Flex(
                      direction: Axis.horizontal,
                      children: [
                        Expanded(
                          child: ListView(
                            scrollDirection: Axis.vertical,
                            children:
                                _buildUsersPendingSection(state.usersPending),
                          ),
                        ),
                        VerticalDivider(
                            thickness: 1, indent: 15, endIndent: 15),
                        Expanded(
                          child: ListView(
                            scrollDirection: Axis.vertical,
                            children: _buildUsersConfirmedSection(
                                state.usersConfirmed),
                          ),
                        ),
                        VerticalDivider(
                            thickness: 1, indent: 15, endIndent: 15),
                        Expanded(
                          child: ListView(
                            scrollDirection: Axis.vertical,
                            children: _buildUsersRefusedOrAbsentSection(
                                state.usersRefusedOrAbsent),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              filteredList: (state) {
                return Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(
                        horizontal: ResponsiveBuilder.isMobile(context)
                            ? 0
                            : MediaQuery.of(context).size.width * 0.15),
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
        autofocus: false,
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
      onPressed: () {
        if (isEditAllowed) {
          FocusScope.of(context).unfocus();
          showDialog(
              context: context,
              builder: (BuildContext _) {
                return BlocProvider.value(
                  value: context.read<PresencesManagementActorBloc>(),
                  child: AddExternalUserDialog(
                    messageText: "Aggiungi risorsa non presente in elenco",
                    date: context.read<DatePickerCubit>().state.visualizedDate,
                  ),
                );
              });
        }
      },
    );
  }

  List<Widget> _buildUsersPendingSection(
      List<UserWithWorkstation> usersPending) {
    List<Widget> list = [
      Container(
          padding: EdgeInsets.all(8),
          child: Text(
            'DA GESTIRE',
            style: TextStyle(color: Colors.blue, fontSize: 16),
          )),
    ];
    usersPending.isEmpty
        ? list.add(ListTile(title: Text('Nessuna risorsa da gestire')))
        : list.addAll(usersPending.map((e) => PresencesManagementTile(
              userWithWorkstation: e,
              onSingleClick: () => null,
              onLongClick: () => null,
              onStatusButtonClick: (newStatus) => _onStatusButtonClick(
                context,
                e.workstation.copyWith(status: newStatus),
              ),
            )));
    return list;
  }

  List<Widget> _buildUsersConfirmedSection(
      List<UserWithWorkstation> usersConfirmed) {
    var list = <Widget>[
      Container(
        padding: EdgeInsets.all(8),
        child: Text(
          'PRESENTI',
          style: TextStyle(color: Colors.blue, fontSize: 16),
        ),
      ),
    ];
    usersConfirmed.isEmpty
        ? list.add(ListTile(title: Text('Nessuna risorsa confermata')))
        : list.addAll(usersConfirmed.map((e) => PresencesManagementTile(
              userWithWorkstation: e,
              onSingleClick: () => _onResourceClick(context, e),
              onLongClick: () => _onResourceLongClick(context, e),
            )));
    return list;
  }

  List<Widget> _buildUsersRefusedOrAbsentSection(
      List<UserWithWorkstation> usersRefusedOrAbsent) {
    return [
      Container(
        padding: EdgeInsets.all(8),
        child: Text(
          'NON PRESENTI',
          style: TextStyle(color: Colors.blue, fontSize: 16),
        ),
      ),
      ...usersRefusedOrAbsent
          .map((e) => PresencesManagementTile(
                userWithWorkstation: e,
                onSingleClick: () => _onResourceClick(context, e),
                onLongClick: () => _onResourceLongClick(context, e),
              ))
          .toList(),
    ];
  }

  _onResourceClick(
      BuildContext context, UserWithWorkstation userWithWorkstation) {
    FocusScope.of(context).unfocus();
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
    FocusScope.of(context).unfocus();
    if (userWithWorkstation.workstation == null) {
      context
          .read<PresencesManagementActorBloc>()
          .add(PresencesManagementActorEvent.added(
            timeSlot: TimeSlot.fullDay,
            date: context.read<DatePickerCubit>().state.visualizedDate,
            idResource: userWithWorkstation.user?.idResource,
            freeName: userWithWorkstation.workstation?.freeName,
          ));
    } else if (userWithWorkstation.workstation.codeWorkstation == null) {
      context
          .read<PresencesManagementActorBloc>()
          .add(PresencesManagementActorEvent.removed(
            userWithWorkstation.workstation,
          ));
    } else {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: Text('Attenzione'),
                content: Text(
                    '${userWithWorkstation.getResourceLabel()} è già stato assegnato/a ad una postazione. \nVuoi comunque procedere con la rimozione della sua presenza? '),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('ANNULLA'),
                  ),
                  TextButton(
                    onPressed: () {
                      context
                          .read<PresencesManagementActorBloc>()
                          .add(PresencesManagementActorEvent.removed(
                            userWithWorkstation.workstation,
                          ));
                      Navigator.pop(context);
                    },
                    child: Text('CONFERMA'),
                  ),
                ],
              ));
    }
  }

  _onStatusButtonClick(BuildContext context, Workstation workstation) {
    context.read<PresencesManagementActorBloc>().add(
          PresencesManagementActorEvent.updated(workstation),
        );
  }
}
