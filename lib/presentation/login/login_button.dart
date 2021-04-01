import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:where_am_i/core/utils/constants.dart';

class LoginButton extends StatelessWidget {
  final String title;
  final Function onTap;
  final isLoading;

  LoginButton(this.title, {this.onTap, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: isLoading
          ? CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 1,
            )
          : MaterialButton(
              elevation: 5.0,
              padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
              onPressed: onTap,
              color: dncBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 1.5,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans'),
              ),
            ),
    );
  }
}
