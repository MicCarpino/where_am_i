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

//widget for the presences management list
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
    //controller for the searchbar
    _textFieldController.addListener(() {
      //add a filter update event to the bloc on text change
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
      //search bar and "add external user" button
      Row(children: [_buildSearchBar(), _buildAddExternalUserButton()]),
      //this list is built only on "success state", so only "load success" and
      //"filter update" states need to be handled
      BlocBuilder<PresencesManagementWatcherBloc,
          PresencesManagementWatcherState>(
        builder: (context, watcherState) {
          return watcherState.maybeMap(
              loadSuccess: (state) {
                //separating the list in 3 sections for the "success state"
                return Expanded(
                  child: ResponsiveBuilder(
                    //on mobile show the sections stacked
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
                    //on tablet/desktop/web show the sections side-by-side
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
              //when there's a "search in progress" show the result in a single list
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

  //search bar widget, the controller take care of interaction with the bloc to filter the list
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

  //button to open the dialog where an external resource can be added
  Widget _buildAddExternalUserButton() {
    final isEditAllowed =
        BlocProvider.of<DatePickerCubit>(context).isEditAllowed();
    return IconButton(
      icon: Icon(Icons.person_add,
          //disabled for past days
          color: isEditAllowed ? Colors.black87 : Colors.grey),
      onPressed: () {
        if (isEditAllowed) {
          FocusScope.of(context).unfocus();
          showDialog(
              context: context,
              builder: (BuildContext _) {
                //open a dialog providing the bloc instance
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

  //list of users with status = 0 (pending)
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
              //define the callback for the confirm/reject buttons
              onStatusButtonClick: (newStatus) => _onStatusButtonClick(
                context,
                e.workstation.copyWith(status: newStatus),
              ),
            )));
    return list;
  }

  //list of users with status = 1 (confirmed)
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
              //define callbacks for single and long click
              onSingleClick: () => _onResourceClick(context, e),
              onLongClick: () => _onResourceLongClick(context, e),
            )));
    return list;
  }

  //list of users with no workstation object or status = 2 (rejected)
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
                //define callbacks for single and long click
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
      //single click, edit operation
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
    //long click, insert operation if there's not a workstation object already
    if (userWithWorkstation.workstation == null) {
      context
          .read<PresencesManagementActorBloc>()
          .add(PresencesManagementActorEvent.added(
            timeSlot: TimeSlot.fullDay,
            date: context.read<DatePickerCubit>().state.visualizedDate,
            idResource: userWithWorkstation.user?.idResource,
            freeName: userWithWorkstation.workstation?.freeName,
          ));
      //remove operation, the workstation object has not a codeWorkstation value
      //so it means the user has not been assigned to a workstation yet
    } else if (userWithWorkstation.workstation.codeWorkstation == null) {
      context
          .read<PresencesManagementActorBloc>()
          .add(PresencesManagementActorEvent.removed(
            userWithWorkstation.workstation,
          ));
    } else {
      //remove operation on a user assigned to a workstation, show the alert dialog
      //and perform the operation on confirmation
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
