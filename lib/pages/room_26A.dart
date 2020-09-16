import 'package:flutter/material.dart';
import 'package:where_am_i/widgets/workstations.dart';

class Room26A extends StatefulWidget {
  @override
  _Room26AState createState() => _Room26AState();
}

class _Room26AState extends State<Room26A> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text('Stanza 1'), Workstations(quantity:6,columnsNumber: 3),
          Text('Stanza 2'),Workstations(quantity:8,columnsNumber: 4),
          Text('Stanza 3'), Workstations(quantity:6,columnsNumber: 3),
          Text('Stanza 4'),Workstations(quantity:6,columnsNumber: 2),
        ],
      ),
    );
  }
}
