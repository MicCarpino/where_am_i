import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'file:///C:/Users/DNC/FlutterProjects/where_am_i/lib/provider.dart';
import 'file:///C:/Users/DNC/FlutterProjects/where_am_i/lib/core/utils/constants.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final FocusNode _usernameFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  bool _rememberMe = false;
  bool _obscureText = false;
  bool _isLoading = false;

  String _username = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 100),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: Column(
                    children: <Widget>[
                      Image(image: AssetImage('assets/dnc_def_logo.png')),
                      Form(
                        key: _formKey,
                        child: _buildForm(),
                      ),
                      _buildLoginBtn(),
                    ],
                  ),
                ),
                Visibility(
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: _isLoading,
                  child: Container(
                    color: Colors.transparent,
                    width: 60.0,
                    height: 60.0,
                    child: new Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: new CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(dncBlue))),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Column(children: [
      SizedBox(height: 30.0),
      _buildUsernameTF(),
      SizedBox(height: 30.0),
      _buildPasswordTF(),
      SizedBox(height: 30.0),
      _buildRememberMeCheckbox()
    ]);
  }

  Widget _buildUsernameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Username', style: kLabelStyle),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            textInputAction: TextInputAction.next,
            focusNode: _usernameFocus,
            onFieldSubmitted: (term) {
              _fieldFocusChange(context, _usernameFocus, _passwordFocus);
            },
            validator: (value) => value.isEmpty ? "Username required" : null,
            onSaved: (value) => _username = value,
            controller: _usernameController,
            keyboardType: TextInputType.text,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(Icons.person, color: dncBlue),
              errorStyle: TextStyle(),
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
            focusNode: _passwordFocus,
            onFieldSubmitted: (value) {
              _passwordFocus.unfocus();
            },
            validator: (value) => value.isEmpty ? "Password required" : null,
            onSaved: (value) => _password = value,
            controller: _passwordController,
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
                  color: dncBlue,
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
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          setState(() {
            _isLoading = true;
          });
          validateAndSubmit();
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

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  bool _validateAndSave() {
    setState(() {
      _isLoading = true;
    });
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void validateAndSubmit() async {
    if (_validateAndSave()) {
      try {
        final loginResult = await performLogin(_username.trim(), _password.trim());
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString(JWT_TOKEN_KEY, loginResult.authenticationToken);
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
          return new HomeScreen();
        }));
      } catch (e) {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
            content: new Text('Error: ${e.toString()}'),
            duration: new Duration(seconds: 5)));
      }
    }
    setState(() {
      _isLoading = false;
    });
  }
}
