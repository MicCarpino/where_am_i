import 'package:flutter/material.dart';
import 'package:where_am_i/pages/login_screen.dart';
import 'package:where_am_i/utilities/shared_preferences.dart';
import 'package:where_am_i/utilities/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WAI", style: TextStyle(color: Colors.white)),
        backgroundColor: dncBlue,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: _buildDrawer(context),
      body: Column(children: [_buildDatePicker()]),
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
                            onTap: () {
                              sharedPreferences.removeJwtToken().then((value) =>
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(builder: (context) {
                                    return new LoginScreen();
                                  })));
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

  _buildDatePicker() {
    return Container(
      color: dncLightBlue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipOval(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                child: SizedBox(
                    width: 50,
                    height: 50,
                    child:
                        Icon(Icons.keyboard_arrow_left, color: Colors.white)),
                onTap: () {
                  print('-');
                },
              ),
            ),
          ),
          GestureDetector(
              child: Text('Martedì 15 settembre 2020',
                  style: TextStyle(color: Colors.white, fontSize: 16)),
              onTap: () {
                _showCalendar(context);
              }),
          ClipOval(
            child: Material(
              color: Colors.transparent, // button color
              child: InkWell(
                splashColor: dncLightBlue, // inkwell color
                child: SizedBox(
                    width: 40,
                    height: 40,
                    child:
                        Icon(Icons.keyboard_arrow_right, color: Colors.white)),
                onTap: () {
                  print('+');
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  _showCalendar(context) async {
    await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(Duration(days: 365)),
        lastDate: DateTime(2021).add(Duration(days: 365)),
        locale: const Locale("it", ""),
        builder: (context, child) {
          return Theme(
            data: ThemeData(),
            child: child,
          );
        }).then((selectedDate) {
      print(selectedDate);
    });
  }
}
