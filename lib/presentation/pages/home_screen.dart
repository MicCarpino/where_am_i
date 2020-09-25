import 'package:flutter/material.dart';
import 'package:where_am_i/core/utils/SharedPreferencesManager.dart';
import 'package:where_am_i/presentation/pages/room_24.dart';
import 'package:where_am_i/presentation/pages/room_26A.dart';
import 'package:where_am_i/presentation/pages/room_26B.dart';
import 'package:where_am_i/presentation/widgets/date_picker.dart';
import 'file:///C:/Users/DNC/FlutterProjects/where_am_i/lib/core/utils/constants.dart';

import 'login_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentItem = 0;
  String _title = "";
  List<Widget> pages = [
    Room26B(),
    Room26A(),
    Room24(),
  ];

  @override
  void initState() {
    _title = "CIVICO 26/B";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title, style: TextStyle(color: Colors.white)),
        backgroundColor: dncBlue,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: _buildDrawer(context),
      body: Column(children: [
        DatePicker(),
        Expanded(
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return pages[index];
            },
            onPageChanged: (pageIndex) {
              switch (pageIndex) {
                case 0:
                  _setAppBarTitle("CIVICO 26/B");
                  break;
                case 1:
                  _setAppBarTitle("CIVICO 26/A");
                  break;
                case 2:
                  _setAppBarTitle("CIVICO 24");
                  break;
              }
            },
            itemCount: pages.length,
          ),
        )
      ]),
    );
  }

  _buildDrawer(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.65,
      child: Drawer(
        child: Column(
          children: [
            Expanded(
                child: ListView(padding: EdgeInsets.zero, children: <Widget>[
              _createDrawerHeader(),
              _createDrawerItem(position: 0, icon: Icons.home, text: 'Home'),
              _createDrawerItem(
                  position: 1,
                  icon: Icons.event_available,
                  text: 'Le mie presenze'),
              _createDrawerItem(
                  position: 2,
                  icon: Icons.supervisor_account,
                  text: 'Gestione presenze'),
              _createDrawerItem(
                  position: 3, icon: Icons.lock_open, text: 'Gestione utenze')
            ])),
            Container(
                child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Column(
                      children: <Widget>[
                        ListTile(
                            leading:
                                Icon(Icons.exit_to_app, color: Colors.black87),
                            title: Text('Logout'),
                            onTap: () async {
                              await SharedPreferencesManager.clearPrefs();
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()),
                                (Route<dynamic> route) => false,
                              );
                            })
                      ],
                    )))
          ],
        ),
      ),
    );
  }

  Widget _createDrawerItem(
      {int position, IconData icon, String text, GestureTapCallback onTap}) {
    return Ink(
      color: position == _currentItem ? dncOrange : null,
      child: ListTile(
        title: Row(
          children: <Widget>[
            Icon(icon,
                color:
                    position == _currentItem ? Colors.white : Colors.black87),
            Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(text,
                    style: TextStyle(
                        color: position == _currentItem
                            ? Colors.white
                            : Colors.black87)))
          ],
        ),
        onTap: () {
          Navigator.pop(context);
          setState(() {
            _currentItem = position;
          });
        },
      ),
    );
  }

//TODO:remove empty space at header bottom
  _createDrawerHeader() {
    return DrawerHeader(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(image: AssetImage('assets/dnc_def_logo.png'), width: 200),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ciao Giangianni',
                style: TextStyle(
                    color: dncBlue, fontSize: 20, fontWeight: FontWeight.bold)),
            Text('Oggi lavori al ',
                style: TextStyle(
                    color: dncBlue, fontSize: 16, fontWeight: FontWeight.bold))
          ],
        ),
      ],
    ));
  }

  _setAppBarTitle(String title) {
    setState(() {
      _title = title;
    });
  }
}
