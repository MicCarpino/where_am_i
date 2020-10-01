import 'package:flutter/material.dart';

class MyPresencesPage extends StatelessWidget {
  final void Function(String title) _setAppBarTitle;
  MyPresencesPage(this._setAppBarTitle);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Le mie presenze'),
      ),
    );
  }
}
