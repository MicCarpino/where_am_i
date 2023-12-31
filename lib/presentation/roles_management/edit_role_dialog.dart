import 'package:flutter/material.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/presentation/responsive_builder.dart';

//dialog widget to edit resources roles
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
      //initialize selected option as the current user role
      _groupValue = widget.userSelected.idRole;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder.buildDialog(
      context,
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //user details
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            color: dncLightBlue,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Seleziona il ruolo da assegnare a ${widget.userSelected.name} ${widget.userSelected.surname} ",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
          // list tile options
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
          //confirm cancel buttons
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Annulla", style: TextStyle(color: Colors.blue)),
                  padding: EdgeInsets.all(16),
                ),
                SizedBox(width: 16),
                MaterialButton(
                  onPressed: () => _onConfirmedPressed(),
                  child: Text("Conferma", style: TextStyle(color: Colors.blue)),
                  padding: EdgeInsets.all(16),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _onConfirmedPressed() {
    //perform role update if a new role has been selected
    if (_groupValue != widget.userSelected.idRole) {
      widget.onNewRoleAssigned(_groupValue);
    }
    Navigator.pop(context);
  }
}
