import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/domain/blocs/roles_management/watcher/roles_management_watcher_bloc.dart';
import 'package:where_am_i/domain/blocs/roles_management/actor/roles_management_actor_bloc.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/presentation/roles_management/edit_role_dialog.dart';

class RoleManagementList extends StatefulWidget {
  RoleManagementList({@required this.users});

  final List<User> users;

  @override
  _RoleManagementListState createState() => _RoleManagementListState();
}

class _RoleManagementListState extends State<RoleManagementList> {
  TextEditingController _textFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    //controller for the searchbar
    _textFieldController.addListener(() {
      //add a filter update event to the bloc on text change
      context.read<RolesManagementWatcherBloc>().add(
          RolesManagementWatcherEvent.onFilterUpdate(
              filter: _textFieldController.text));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //search bar
        TextField(
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
                    onPressed: () => _textFieldController.clear(),
                    icon: Icon(Icons.clear, color: Colors.black),
                  ),
          ),
        ),
        //list of users with roles indicated on right side
        Expanded(
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            separatorBuilder: (_, index) => Divider(
              color: Colors.black26,
            ),
            itemCount: widget.users.length,
            itemBuilder: (itemContext, index) {
              var user = widget.users[index];
              return ListTile(
                title: Text(
                  "${user.surname} ${user.name}",
                  style: TextStyle(color: Colors.black),
                ),
                trailing: _buildRoleLabel(user.idRole),
                //on single click open the role management dialog
                onTap: () => showDialog(
                  context: context,
                  builder: (BuildContext _) {
                    FocusScope.of(context).unfocus();
                    return EditRoleDialog(
                      userSelected: user,
                      onNewRoleAssigned: (newRoleId) =>
                      //callback when a new role is assigned
                          itemContext.read<RolesManagementActorBloc>().add(
                                RolesManagementActorEvent.onRoleUpdate(
                                    user, newRoleId),
                              ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Text _buildRoleLabel(int idRole) {
    if (idRole == ROLE_ADMIN) {
      return Text("ADMIN", style: TextStyle(color: Colors.red));
    } else if (idRole == ROLE_STAFF) {
      return Text("STAFF", style: TextStyle(color: dncOrange));
    } else {
      return Text("USER", style: TextStyle(color: dncBlue));
    }
  }

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }
}
