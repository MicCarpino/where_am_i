import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/presentation/bloc/users/users_bloc.dart';
import 'package:where_am_i/presentation/widgets/circular_loading.dart';

final sl = GetIt.instance;

class UsersManagementPage extends StatefulWidget {
  final void Function(String title) _setAppBarTitle;

  UsersManagementPage(this._setAppBarTitle);

  @override
  _UsersManagementPageState createState() => _UsersManagementPageState();
}

class _UsersManagementPageState extends State<UsersManagementPage> {
  UsersBloc _usersBloc;

  @override
  void initState() {
    _usersBloc = sl<UsersBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersBloc, UsersState>(
        cubit: _usersBloc,
        builder: (context, state) {
          if (state is UsersInitial) {
            _usersBloc.add(FetchUsersList());
            return CircularLoading();
          }
          if (state is UserFetchCompleteState) {
            return Column(
              children: [
                TextField(
                  maxLines: 1,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 14.0),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    prefixIcon: Icon(Icons.search, color: Colors.black),
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
                          style: TextStyle(
                              color: user.idWorkstation != null
                                  ? Colors.black
                                  : Colors.black38),
                        ),
                        trailing: _buildRoleLabel(user.idRole),
                      );
                    },
                    itemCount: state.usersList.length,
                  ),
                ),
              ],
            );
          } else if (state is UsersFetchErrorState) {
            return Center(
              child: MaterialButton(child: Text('riprova'), onPressed: () {}),
            );
          } else {
            return Center(child: CircularLoading());
          }
        });
  }

  @override
  void dispose() {
    _usersBloc.close();
    super.dispose();
  }

  Text _buildRoleLabel(int idRole) {
    if (idRole == ROLE_ADMIN) {
      return Text("ADMIN", style: TextStyle(color: Colors.red ));
    } else if (idRole == ROLE_STAFF) {
      return Text("STAFF", style: TextStyle(color: dncOrange));
    } else {
      return Text("USER", style: TextStyle(color:dncBlue));
    }
  }
}
