import 'package:flutter/material.dart';
import 'package:where_am_i/core/utils/SharedPreferencesManager.dart';
import 'package:where_am_i/presentation/widgets/login_button.dart';

import 'login_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: LoginButton(
            'Logout',
            onTap: () async {
              await SharedPreferencesManager.clearPrefs();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
                    (Route<dynamic> route) => false,
              );
            },
          ),
        ),
      ),
    );
  }
}
