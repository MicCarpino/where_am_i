import 'package:flutter/material.dart';

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
          Text('Stanza 1'), _generateWorkstations(6,3),
          Text('Stanza 2'), _generateWorkstations(8,4),
          Text('Stanza 3'), _generateWorkstations(6,3),
          Text('Stanza 4'), _generateWorkstations(6,2),
        ],
      ),
    );
  }

  _generateWorkstations(int quantity,int columns){
    return GridView.count(
      physics:ScrollPhysics(),
      shrinkWrap: true,
      childAspectRatio: 1 / 1,
      crossAxisCount: columns,
      children: List.generate(quantity, (index) {
        return FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(color: Colors.black54)),
            onPressed: () {},
            child: Text('boh'));
      }),
    );
  }
}
