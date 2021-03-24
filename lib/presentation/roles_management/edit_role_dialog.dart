import 'package:flutter/material.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/domain/entities/user.dart';

class EditRoleDialog extends StatefulWidget {
  final User userSelected;
  final Function(int newRoleId) onNewRoleAssigned;

  EditRoleDialog({
    @required this.userSelected,
    @required this.onNewRoleAssigned,
  });

  @override
  _EditRoleDialogState createState() => _EditRoleDialogState();
}

class _EditRoleDialogState extends State<EditRoleDialog> {
  int _groupValue = 0;

  @override
  void initState() {
    setState(() {
      _groupValue = widget.userSelected.idRole;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Seleziona il ruolo da assegnare a ${widget.userSelected.surname} ${widget.userSelected.name}",
              style: TextStyle(fontSize: 16),
            ),
          ),
          RadioListTile(
              value: ROLE_ADMIN,
              title: Text('ADMIN'),
              selected: widget.userSelected.idRole == ROLE_ADMIN,
              groupValue: _groupValue,
              onChanged: (value) => setState(() {
                    _groupValue = ROLE_ADMIN;
                  })),
          RadioListTile(
              value: ROLE_STAFF,
              title: Text('STAFF'),
              selected: widget.userSelected.idRole == ROLE_STAFF,
              groupValue: _groupValue,
              onChanged: (value) => setState(() {
                    _groupValue = ROLE_STAFF;
                  })),
          RadioListTile(
              value: ROLE_USER,
              title: Text('USER'),
              selected: widget.userSelected.idRole == ROLE_USER,
              groupValue: _groupValue,
              onChanged: (value) => setState(() {
                    _groupValue = ROLE_USER;
                  })),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0, right: 16),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Annulla",
                        style: TextStyle(color: dncBlue),
                      ),
                      color: Colors.transparent,
                      padding: EdgeInsets.all(8),
                    ),
                    SizedBox(width: 16),
                    FlatButton(
                      onPressed: () => _onConfirmedPressed(),
                      child: Text("Conferma", style: TextStyle(color: dncBlue)),
                      color: Colors.transparent,
                      padding: EdgeInsets.all(8),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  _onConfirmedPressed() {
    if (_groupValue != widget.userSelected.idRole) {
      widget.onNewRoleAssigned(_groupValue);
    }
    Navigator.pop(context);
  }
}
