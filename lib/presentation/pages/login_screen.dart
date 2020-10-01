import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/core/utils/size_config.dart';
import 'package:where_am_i/presentation/bloc/login/login_bloc.dart';
import 'package:where_am_i/presentation/bloc/login/login_state.dart';
import 'package:where_am_i/presentation/bloc/login/login_event.dart';
import 'package:where_am_i/presentation/pages/main_screen.dart';
import 'package:where_am_i/presentation/widgets/login_button.dart';

final sl = GetIt.instance;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final FocusNode _usernameFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final ScrollController _scrollController = ScrollController();
  bool _rememberMe = false;
  bool _obscureText = false;
  bool _isLoading = false;
  LoginBloc loginBloc = sl<LoginBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      extendBodyBehindAppBar: false,
      backgroundColor: Colors.white,
      body: BlocConsumer<LoginBloc, LoginState>(
        cubit: loginBloc,
        listener: (context, state) {
          if(state is LoadingState){
            _isLoading = true;
          }
          if (state is FailureState) {
            _isLoading = false;
            Scaffold.of(context).showSnackBar(SnackBar(
                content: new Text('Error: ${state.error}'),
                duration: new Duration(seconds: 5)));
          }
          if (state is LoggedInState) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => MainScreen()),
              (Route<dynamic> route) => false,
            );
          }
        },
        builder: (context, state) {
          return GestureDetector(
              onTap: () {
                //Dismiss soft keyboard if user taps somewhere on the screen
                FocusScope.of(context).requestFocus(new FocusNode());
              },
              child: phoneLayout(context));
        },
      ),
    );
  }

  Widget phoneLayout(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
      child: Stack(
        children: <Widget>[
          SingleChildScrollView(
            controller: _scrollController,
            physics: AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 100),
            child: Center(
              child: Column(
                children: <Widget>[
                  Image(image: AssetImage('assets/dnc_def_logo.png')),
                  Form(key: _formKey, child: _formFields())
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: SizeConfig.safeBlockVertical * 4,
                    left: 2.0,
                    right: 2.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    LoginButton(
                      'Log In',
                      isLoading: _isLoading,
                      onTap: () => _login(context),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _formFields() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: SizeConfig.safeBlockVertical * 10),
          _buildUsernameTF(),
          SizedBox(height: SizeConfig.safeBlockVertical * 3),
          _buildPasswordTF(),
          SizedBox(height: SizeConfig.safeBlockVertical * 3),
          _buildRememberMeCheckbox()
        ],
    );
  }

  _login(BuildContext context) {
    String email = _usernameController.value.text;
    String password = _passwordController.value.text;
    if (email.isEmpty || password.isEmpty) {
      Scaffold.of(context).showSnackBar(SnackBar(
          content: new Text('Username and password fields must not be empty'),
          duration: new Duration(seconds: 5)));
    } else {
      loginBloc.add(LoginButtonPressed(username: email, password: password));
    }
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
        Text('Password', style: kLabelStyle),
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
            controller: _passwordController,
            obscureText: _obscureText,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(Icons.lock, color: dncBlue),
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
                    color: dncBlue),
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

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
