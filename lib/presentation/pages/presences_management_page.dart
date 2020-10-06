import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:where_am_i/presentation/bloc/workstation/workstation_bloc.dart';
import 'package:where_am_i/presentation/widgets/circular_loading.dart';
import 'package:where_am_i/presentation/widgets/date_picker.dart';

final sl = GetIt.instance;

class PresencesManagementPage extends StatefulWidget {
  final void Function(String title) _setAppBarTitle;

  PresencesManagementPage(this._setAppBarTitle);

  @override
  _PresencesManagementPageState createState() =>
      _PresencesManagementPageState();
}

class _PresencesManagementPageState extends State<PresencesManagementPage> {
  WorkstationBloc _workstationBloc = sl<WorkstationBloc>();
  List<DateTime> userPresences = [];

  @override
  void initState() {
    _workstationBloc.add(FetchAllUserPresences(dateToFetch: DateTime.now()));
    super.initState();
  }

  @override
  void dispose() {
    _workstationBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkstationBloc, WorkstationState>(
        cubit: _workstationBloc,
        builder: (context, state) {
          if (state is AllUsersPresencesFetchCompleted) {
            return Column(
              children: [
                DatePicker(onDateChanged),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        maxLines: 1,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top: 14.0),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          prefixIcon: Icon(Icons.search, color: Colors.black),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.person_add),
                      onPressed: () {},
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => Divider(
                      color: Colors.black26,
                    ),
                    itemBuilder: (context, index) {
                      var user = state.allUsersPresences[index];
                      return ListTile(
                        title: Text(
                          "${user.surname} ${user.name}",
                          style: TextStyle(
                              color: user.idWorkstation != null
                                  ? Colors.black
                                  : Colors.black38),
                        ),
                      );
                    },
                    itemCount: state.allUsersPresences.length,
                  ),
                ),
              ],
            );
          } else if (state is WorkstationsFetchErrorState) {
            return Center(
              child: MaterialButton(child: Text('riprova'), onPressed: () {}),
            );
          } else {
            return Center(child: CircularLoading());
          }
        });
  }

  onDateChanged(DateTime newDate) {
    _workstationBloc.add(FetchAllUserPresences(dateToFetch: newDate));
  }
}
