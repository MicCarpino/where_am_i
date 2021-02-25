import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:where_am_i/core/usecases/usecase.dart';
import 'package:where_am_i/core/utils/constants.dart';

import 'package:where_am_i/core/utils/extensions.dart';
import 'package:where_am_i/domain/entities/user_with_workstation.dart';
import 'package:where_am_i/presentation/bloc/presences_management/presences_management_bloc.dart';
import 'package:where_am_i/presentation/widgets/circular_loading.dart';
import 'package:where_am_i/presentation/widgets/date_picker.dart';
import 'package:where_am_i/presentation/widgets/presences_management_tile.dart';
import 'package:where_am_i/presentation/widgets/retry_widget.dart';
import 'package:where_am_i/presentation/widgets/text_input_dialog.dart';
import 'package:where_am_i/presentation/widgets/time_slot_dialog.dart';
import 'package:where_am_i/presentation/widgets/time_slot_dialog2.dart';

final serviceLocator = GetIt.instance;

class PresencesManagementPage extends StatefulWidget {
  @override
  _PresencesManagementPageState createState() =>
      _PresencesManagementPageState();
}

class _PresencesManagementPageState extends State<PresencesManagementPage> {
  PresencesManagementBloc _presencesManagementBloc =
      serviceLocator<PresencesManagementBloc>();
  TextEditingController _textFieldController = TextEditingController();
  DateTime visualizedDate;
  bool canEditForVisualizedDate = false;

  @override
  void initState() {
    _textFieldController.addListener(() {
      _filterList(_textFieldController.text);
    });
    _presencesManagementBloc
        .add(OnUsersPresencesFetchRequested(dateToFetch: DateTime.now()));
    visualizedDate = DateTime.now().zeroed();
    canEditForVisualizedDate = DateTime.now().isAfter(visualizedDate);
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
          child:
              BlocConsumer<PresencesManagementBloc, PresencesManagementState>(
            cubit: _presencesManagementBloc,
            buildWhen: (previous, current) =>
                current is PresencesManagementFetchCompletedState ||
                current is PresencesManagementFetchErrorState ||
                current is PresencesManagementFetchLoadingState,
            builder: (context, state) {
              if (state is PresencesManagementFetchCompletedState) {
                return _buildPageBody(state.allUsersPresences);
              } else if (state is PresencesManagementFetchLoadingState) {
                return Center(child: CircularLoading());
              } else {
                return Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Center(
                        child: RetryWidget(
                      onTryAgainPressed: () => _presencesManagementBloc.add(
                          OnUsersPresencesFetchRequested(
                              dateToFetch: DateTime.now())),
                    )));
              }
            },
            listener: (context, state) {
              if (state is PresencesManagementErrorMessageState) {
                _showSnackbarWithMessage(state.errorMessage);
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPageBody(List<UserWithWorkstation> presences) {
    return Column(
      children: [
        Row(children: [
          _buildSearchBar(),
          _buildAddExternalUserButton(),
        ]),
        _buildListView(presences),
      ],
    );
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
                    onPressed: () => _textFieldController.clear(),
                    icon: Icon(Icons.clear, color: Colors.black),
                  )),
      ),
    );
  }

  Widget _buildAddExternalUserButton() {
    return IconButton(
        icon: Icon(Icons.person_add,
            color: canEditForVisualizedDate ? Colors.black87 : Colors.grey),
        onPressed: () => canEditForVisualizedDate
            ? showDialog(
                context: context,
                builder: (BuildContext context) {
                  return TextInputDialog(
                    messageText: "Aggiungi risorsa non presente in elenco",
                    onAddButtonPressed: (String externalUser) =>
                        _presencesManagementBloc.add(
                      OnPresenceAddedByManagement(
                        PresenceNewParameters(
                          date: this.visualizedDate,
                          freeName: externalUser,
                          startTime: TIME_SLOT_NINE,
                          endTime: TIME_SLOT_EIGHTEEN,
                        ),
                      ),
                    ),
                  );
                })
            : null);
  }

  Widget _buildListView(List<UserWithWorkstation> presences) {
    return Expanded(
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        separatorBuilder: (context, index) => Divider(color: Colors.black26),
        itemBuilder: (context, index) => PresencesManagementTile(
          userWithWorkstation: presences[index],
          onSingleClick: () => _onUserClick(presences[index]),
          onLongClick: () => _onUserLongClick(presences[index]),
          onStatusButtonClick: (value) =>
              _presencesManagementBloc.add(OnUserPresenceStatusUpdate(value)),
        ),
        itemCount: presences.length,
      ),
    );
  }

  _onDateChanged(DateTime newDate) {
    setState(() {
      this.visualizedDate = newDate;
      var todayToZero = DateTime.now().zeroed();
      this.canEditForVisualizedDate =
          newDate.isAfter(todayToZero) || newDate.isAtSameMomentAs(todayToZero);
      _presencesManagementBloc
          .add(OnUsersPresencesFetchRequested(dateToFetch: newDate));
    });
  }

  _onUserLongClick(UserWithWorkstation userWithWorkstation) {
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
              return TimeSlotDialog2(
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
