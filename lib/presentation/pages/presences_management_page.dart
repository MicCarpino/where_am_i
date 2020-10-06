import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:where_am_i/domain/entities/workstation.dart';

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
  WorkstationBloc _workstationBloc = sl<WorkstationBloc>();
  List<DateTime> userPresences = [];
  TextEditingController _textFieldController = TextEditingController();
  DateTime visualizedDate;

  @override
  void initState() {
    _textFieldController.addListener(() {
      _filterList(_textFieldController.text);
    });
    _workstationBloc.add(FetchAllUserPresences(dateToFetch: DateTime.now()));
    visualizedDate = DateTime.now();
    super.initState();
  }

  @override
  void dispose() {
    _textFieldController.dispose();
    _workstationBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DatePicker(_onDateChanged),
        Expanded(
          child: BlocBuilder<WorkstationBloc, WorkstationState>(
              cubit: _workstationBloc,
              builder: (context, state) {
                if (state is AllUsersPresencesFetchCompleted) {
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
                                prefixIcon:
                                    Icon(Icons.search, color: Colors.black),
                              ),
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
                                            _onExternalUserAdded,
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
                    child: MaterialButton(
                        child: Text('riprova'), onPressed: () {}),
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
    _workstationBloc.add(FetchAllUserPresences(dateToFetch: newDate));
  }

  _onExternalUserAdded(String externalUser) {
    if (externalUser.isNotEmpty) {
      _showSnackbarWithMessage(externalUser);
      _workstationBloc.add(OnExternalUserAdded(
          externalUser: Workstation(
        idWorkstation: null,
        codeWorkstation: null,
        idResource: null,
        freeName: externalUser,
        resourceName: null,
        resourceSurname: null,
        workstationDate: this.visualizedDate,
      )));
    } else {
      _showSnackbarWithMessage('Inserimento risorsa non riuscito');
    }
  }

  _showSnackbarWithMessage(String message) {
    Scaffold.of(context).showSnackBar(SnackBar(
        content: new Text(message), duration: new Duration(seconds: 3)));
  }

  _filterList(String input) {
  }
}
