import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'file:///C:/Users/DNC/FlutterProjects/where_am_i/lib/features/presentation/widgets/event_calendar.dart';
import 'file:///C:/Users/DNC/FlutterProjects/where_am_i/lib/features/presentation/widgets/workstations.dart';

class Room26B extends StatefulWidget {
  @override
  _Room26BState createState() => _Room26BState();
}

class _Room26BState extends State<Room26B> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(16),
        child: Column(children: [
          Workstations(quantity: 18, columnsNumber: 3, columnsSpacing: 15),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('Saletta riunioni - civico 26'),
            IconButton(icon: Icon(Icons.settings), onPressed: () {})
          ]),
          EventCalendar()
        ]));
  }
}
