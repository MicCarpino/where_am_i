import 'package:flutter/material.dart';

class UsersManagementPage extends StatelessWidget {
  final void Function(String title) _setAppBarTitle;
  UsersManagementPage(this._setAppBarTitle);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Gestione utenze'),
      ),
    );
  }
}
