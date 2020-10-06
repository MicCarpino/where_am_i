import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/presentation/bloc/home/home_bloc.dart';
import 'package:where_am_i/presentation/widgets/date_picker.dart';
import 'package:where_am_i/presentation/widgets/room_24.dart';
import 'package:where_am_i/presentation/widgets/room_26A.dart';
import 'package:where_am_i/presentation/widgets/room_26B.dart';

List<Widget> pages = [
  Room26B(),
  Room26A(),
  Room24(),
];

class HomePage extends StatelessWidget {
  final void Function(String title) _setAppBarTitle;
  final void Function(DateTime date) _onDateChanged;

  HomePage(this._setAppBarTitle, this._onDateChanged);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      DatePicker(this._onDateChanged),
      Expanded(
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return pages[index];
          },
          onPageChanged: (pageIndex) {
            switch (pageIndex) {
              case 0:
                this._setAppBarTitle("CIVICO 26/B");
                break;
              case 1:
                _setAppBarTitle("CIVICO 26/A");
                break;
              case 2:
                _setAppBarTitle("CIVICO 24");
                break;
            }
          },
          itemCount: pages.length,
        ),
      ),
    ]);
  }
}
