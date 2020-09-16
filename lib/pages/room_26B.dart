import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
          _generateWorkstations(),
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

  _generateWorkstations() {
    return SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          childAspectRatio: 1 / 1,
          crossAxisCount: 3,
          mainAxisSpacing: 0,
          crossAxisSpacing: 15,
          children: List.generate(18, (index) {
            return FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(color: Colors.black54)),
                onPressed: () {},
                child: Text('boh'));
          }),
        ));
  }

  _generateCalendar() {
    return Container(
      width: double.infinity,
      color: Colors.red,
      height: 200,
    );
  }
}
