import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/presentation/bloc/users_management/users_management_bloc.dart';
import 'package:where_am_i/presentation/widgets/circular_loading.dart';
import 'file:///C:/Users/DNC/FlutterProjects/where_am_i/lib/presentation/widgets/dialogs/edit_role_dialog.dart';
import 'package:where_am_i/presentation/widgets/retry_widget.dart';

final sl = GetIt.instance;

class UsersManagementPage extends StatefulWidget {
  @override
  _UsersManagementPageState createState() => _UsersManagementPageState();
}

class _UsersManagementPageState extends State<UsersManagementPage> {
  UsersManagementBloc _usersBloc;
  TextEditingController _textFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textFieldController.addListener(() {
      _filterList(_textFieldController.text);
    });
    _usersBloc = sl<UsersManagementBloc>()..add(OnUsersListFetchRequested());
  }

  @override
  void dispose() {
    _textFieldController.dispose();
    _usersBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UsersManagementBloc, UsersManagementState>(
      cubit: _usersBloc,
      buildWhen: (previous, current) =>
          current is UsersListReadyState ||
          current is UsersListErrorState ||
          current is UsersListLoadingState,
      builder: (context, state) {
        if (state is UsersListReadyState) {
          return _buildUsersList(state);
        } else if (state is UsersListLoadingState) {
          return Center(child: CircularLoading());
        } else {
          return Container(
              width: double.infinity,
              height: double.infinity,
              child: Center(
                child: RetryWidget(
                    onTryAgainPressed: () =>
                        _usersBloc.add(OnUsersListFetchRequested())),
              ));
        }
      },
      listener: (context, state) {
        if (state is UserUpdateErrorState) {
          Scaffold.of(context).showSnackBar(SnackBar(
              content: new Text(state.errorMessage),
              duration: new Duration(seconds: 3)));
        }
      },
    );
  }

  Column _buildUsersList(UsersListReadyState state) {
    return Column(
      children: [
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
        Expanded(
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            separatorBuilder: (context, index) => Divider(
              color: Colors.black26,
            ),
            itemBuilder: (context, index) {
              var user = state.usersList[index];
              return ListTile(
                title: Text(
                  "${user.surname} ${user.name}",
                  style: TextStyle(color: Colors.black),
                ),
                trailing: _buildRoleLabel(user.idRole),
                onLongPress: () => showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return EditRoleDialog(
                      userSelected: user,
                      onNewRoleAssigned: (newRoleId) => _usersBloc.add(
                        OnNewRoleAssigned(
                          userUpdated: User(
                              idResource: user.idResource,
                              surname: user.surname,
                              name: user.name,
                              idRole: newRoleId),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
            itemCount: state.usersList.length,
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

  _filterList(String input) {
    _usersBloc.add(OnUsersListFilterUpdated(filterInput: input));
  }
}
