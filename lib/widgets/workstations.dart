import 'package:flutter/material.dart';

class Workstations extends StatelessWidget {
  const Workstations( {
    Key key,this.quantity,this.columnsNumber,this.columnsSpacing = 0
  }) : super(key: key);

  final int quantity;
  final int columnsNumber;
  final double columnsSpacing;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: GridView.count(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          childAspectRatio: 1 / 1,
          crossAxisCount: columnsNumber,
          mainAxisSpacing: 0,
          crossAxisSpacing: columnsSpacing,
          children: List.generate(quantity, (index) {
            return FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(color: Colors.black54)),
                onPressed: () {},
                child: Text('boh'));
          }),
        ));
  }
}