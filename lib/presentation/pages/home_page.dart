import 'package:flutter/material.dart';
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
  HomePage(this._setAppBarTitle);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      DatePicker(),
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
