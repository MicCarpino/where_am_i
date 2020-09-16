import 'package:flutter/material.dart';

class Workstations extends StatefulWidget {
  const Workstations( {
    Key key,this.quantity,this.columnsNumber,this.columnsSpacing = 0
  }) : super(key: key);

  final int quantity;
  final int columnsNumber;
  final double columnsSpacing;

  @override
  _WorkstationsState createState() => _WorkstationsState();
}

class _WorkstationsState extends State<Workstations> {
  @override
  Widget build(BuildContext context) {
    return  GridView.count(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          childAspectRatio: 1 / 1,
          crossAxisCount: widget.columnsNumber,
          mainAxisSpacing: 0,
          crossAxisSpacing: widget.columnsSpacing,
          children: List.generate(widget.quantity, (index) {
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