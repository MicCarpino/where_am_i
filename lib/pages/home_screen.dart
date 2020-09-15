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
      body: Center(
        child: Text('Welcome'),
      ),
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
}
