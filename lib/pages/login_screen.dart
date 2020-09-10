import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:where_am_i/pages/home_screen.dart';
import 'package:where_am_i/utilities/constants.dart';

class LoginScreen extends StatefulWidget {
  static String tag = 'login-screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;
  bool _obscureText = false;

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Username',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.text,
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.person,
                color: dncBlue,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            obscureText: _obscureText,
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: dncBlue,
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  semanticLabel:
                      _obscureText ? 'show password' : 'hide password',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRememberMeCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.black54),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.white,
              activeColor: dncBlue,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
          ),
          Text('Remember me', style: kLabelStyle),
        ],
      ),
    );
  }

  Widget _buildLoginBtn() {
    Route route = MaterialPageRoute(builder: (context) => HomeScreen());
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => {
          Navigator.pushReplacement(context, route)
        },
        padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: dncBlue,
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(

          onTap: () => FocusScope.of(context).unfocus(),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 40
                  ,vertical: 100),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image(image: AssetImage('assets/dnc_def_logo.png')),
                        SizedBox(height: 30.0),
                        _buildEmailTF(),
                        SizedBox(height: 30.0),
                        _buildPasswordTF(),
                        SizedBox(height: 30.0),
                        _buildRememberMeCheckbox(),
                        _buildLoginBtn(),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
