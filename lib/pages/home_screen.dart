import 'package:flutter/material.dart';
import 'package:where_am_i/pages/login_screen.dart';
import 'package:where_am_i/utilities/shared_preferences.dart';
import 'package:where_am_i/utilities/constants.dart';

class HomeScreen extends StatelessWidget {
  static String tag = 'home-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("WAI"),backgroundColor: dncBlue),
      drawer: _buildDrawer(context),
      body: Center(
        child: Text('Welcome'),
      ),
    );
  }

  _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(
              color: dncLightBlue,
            ),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Le mie presenze'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Gestione presenze'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Logout'),
            onTap: () {
              sharedPreferences
                  .removeJwtToken()
                  .then((value) => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => new LoginScreen()),
                      ));
              sharedPreferences.jwtToken = null;
            },
          )
        ],
      ),
    );
  }
}
