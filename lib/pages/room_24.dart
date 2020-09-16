import 'package:flutter/material.dart';
import 'package:where_am_i/widgets/event_calendar.dart';
import 'package:where_am_i/widgets/workstations.dart';

class Room24 extends StatefulWidget {
  @override
  _Room24State createState() => _Room24State();
}

class _Room24State extends State<Room24> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Workstations(quantity: 8, columnsNumber: 2)),
              SizedBox(width: 16),
              Expanded(child: Workstations(quantity: 8, columnsNumber: 2))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Saletta riunioni - Civico 24'),
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {},
              ),
            ],
          ),
          EventCalendar()
        ],
      ),
    );
  }
}
