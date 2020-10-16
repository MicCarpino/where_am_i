import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:where_am_i/domain/entities/user_with_workstation.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/presentation/bloc/presences_management/presences_management_bloc.dart';

import 'package:where_am_i/presentation/bloc/workstation/workstation_bloc.dart';
import 'package:where_am_i/presentation/widgets/circular_loading.dart';
import 'package:where_am_i/presentation/widgets/date_picker.dart';
import 'package:where_am_i/presentation/widgets/text_input_dialog.dart';

final sl = GetIt.instance;

class PresencesManagementPage extends StatefulWidget {
  final void Function(String title) _setAppBarTitle;

  PresencesManagementPage(this._setAppBarTitle);

  @override
  _PresencesManagementPageState createState() =>
      _PresencesManagementPageState();
}

class _PresencesManagementPageState extends State<PresencesManagementPage> {
  PresencesManagementBloc _presencesManagementBloc =
      sl<PresencesManagementBloc>();
  TextEditingController _textFieldController = TextEditingController();
  DateTime visualizedDate;

  @override
  void initState() {
    _textFieldController.addListener(() {
      _filterList(_textFieldController.text);
    });
    _presencesManagementBloc
        .add(OnUsersPresencesFetchRequested(dateToFetch: DateTime.now()));
    visualizedDate = DateTime.now();
    super.initState();
  }

  @override
  void dispose() {
    _textFieldController.dispose();
    _presencesManagementBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DatePicker(_onDateChanged),
        Expanded(
          child: BlocBuilder<PresencesManagementBloc, PresencesManagementState>(
              cubit: _presencesManagementBloc,
              builder: (context, state) {
                if (state is UsersPresencesReadyState) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
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
                                          onPressed: () =>
                                              _textFieldController.clear(),
                                          icon: Icon(Icons.clear,
                                              color: Colors.black),
                                        )),
                            ),
                          ),
                          IconButton(
                              icon: Icon(Icons.person_add),
                              onPressed: () {
                                return showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return TextInputDialog(
                                        messageText:
                                            "Aggiungi risorsa non presente in elenco",
                                        onAddButtonPressed:
                                            (String externalUser) =>
                                                _presencesManagementBloc.add(
                                          OnInsertWorkstation(
                                              workstation: Workstation(
                                            idWorkstation: null,
                                            codeWorkstation: null,
                                            freeName: externalUser,
                                            workstationDate:
                                                this.visualizedDate,
                                          )),
                                        ),
                                      );
                                    });
                              })
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
                            var userWithWorkstation =
                                state.allUsersPresences[index];
                            //TODO: workstation.idResource for free name is "null"
                            return ListTile(
                                title: Text(
                                  userWithWorkstation.user !=
                                          null
                                      ? "${userWithWorkstation.user?.surname} ${userWithWorkstation.user?.name}"
                                      : userWithWorkstation
                                          .workstation.freeName,
                                  style: TextStyle(
                                      color: userWithWorkstation.workstation !=
                                              null
                                          ? Colors.black
                                          : Colors.black38),
                                ),
                                onLongPress: () =>
                                    _onUserLongClick(userWithWorkstation));
                          },
                          itemCount: state.allUsersPresences.length,
                        ),
                      ),
                    ],
                  );
                } else if (state is WorkstationsFetchErrorState) {
                  return Center(
                    child: MaterialButton(
                        child: Text('riprova'),
                        onPressed: () => OnUsersPresencesFetchRequested(
                            dateToFetch: this.visualizedDate)),
                  );
                } else {
                  return Center(child: CircularLoading());
                }
              }),
        ),
      ],
    );
  }

  _onDateChanged(DateTime newDate) {
    this.visualizedDate = newDate;
    _presencesManagementBloc
        .add(OnUsersPresencesFetchRequested(dateToFetch: newDate));
  }

  _onUserLongClick(UserWithWorkstation userWithWorkstation) {
    userWithWorkstation.workstation == null
        ? _presencesManagementBloc.add(OnInsertWorkstation(
            workstation: Workstation(
            idWorkstation: null,
            codeWorkstation: null,
            idResource: userWithWorkstation.user.idResource,
            workstationDate: this.visualizedDate,
          )))
        : _presencesManagementBloc.add(OnDeleteWorkstation(
            idWorkstation: userWithWorkstation.workstation.idWorkstation));
    _textFieldController.clear();
  }

  _showSnackbarWithMessage(String message) {
    Scaffold.of(context).showSnackBar(SnackBar(
        content: new Text(message), duration: new Duration(seconds: 3)));
  }

  _filterList(String input) {
    _presencesManagementBloc
        .add(OnUsersPresencesFilterUpdate(filterInput: input));
  }
}
