import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:where_am_i/core/utils/constants.dart';

class LoginButton extends StatelessWidget {
  final String title;
  final Function onTap;
  final isLoading;
  final Color buttonColor;
  final Color textColor;

  LoginButton(this.title,
      {this.onTap,
      this.isLoading = false,
      this.buttonColor = Colors.blue,
      this.textColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 1,
            ),
          )
        : Container(
            padding: EdgeInsets.symmetric(vertical: 25.0),
            child: RaisedButton(
              elevation: 5.0,
              padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
              onPressed: onTap,
              color: dncBlue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              disabledColor: Colors.grey,
              child: Text(title,
                  style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 1.5,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans')),
            ),
          );
  }
}
