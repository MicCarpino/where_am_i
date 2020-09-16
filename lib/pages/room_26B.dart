import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Room26B extends StatefulWidget {
  @override
  _Room26BState createState() => _Room26BState();
}

class _Room26BState extends State<Room26B> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          childAspectRatio: 1 / 1,
          crossAxisCount: 3,
          mainAxisSpacing: 0,
          crossAxisSpacing: 15,
          children: List.generate(18, (index) {
            return FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.black87)),
                onPressed: () {},
                child: Text('boh'));
          }),
        ));
  }
}
