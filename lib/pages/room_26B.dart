import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:where_am_i/widgets/workstations.dart';

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
      child: Column(
        children: [
          Workstations(quantity: 18, columnsNumber: 3, columnsSpacing: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Saletta riunioni - civico 26'),
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {},
              )
            ],
          ),
          _generateCalendar()
        ],
      ),
    );
  }

  _generateCalendar() {
    return Container(
      width: double.infinity,
      color: Colors.red,
      height: 200,
    );
  }
}
