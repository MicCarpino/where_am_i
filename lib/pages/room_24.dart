import 'package:flutter/material.dart';

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
            children: [
              Container(width: 160,child: _generateWorkstations(),),
              Container(width: 160,child: _generateWorkstations(),),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Saletta riunioni - civico 24'),
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {},
              )
            ],
          ),
        ],
      ),
    );
  }

  _generateWorkstations() {
    return GridView.count(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      childAspectRatio: 1 / 1,
      crossAxisCount: 2,
      mainAxisSpacing: 0,
      crossAxisSpacing: 0,
      children: List.generate(8, (index) {
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
