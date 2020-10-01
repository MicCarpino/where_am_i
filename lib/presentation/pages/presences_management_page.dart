import 'package:flutter/material.dart';

class PresencesManagementPage extends StatelessWidget {
  final void Function(String title) _setAppBarTitle;
  PresencesManagementPage(this._setAppBarTitle);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Gestione presenze'),
      ),
    );
  }
}
