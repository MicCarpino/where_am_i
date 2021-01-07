import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/core/utils/styles.dart';
import 'package:where_am_i/core/utils/size_config.dart';
import 'package:where_am_i/presentation/bloc/login/login_bloc.dart';
import 'package:where_am_i/presentation/bloc/login/login_state.dart';
import 'package:where_am_i/presentation/bloc/login/login_event.dart';
import 'package:where_am_i/presentation/widgets/login_button.dart';

final sl = GetIt.instance;

class LoginScreen extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => LoginScreen());
  }

  @override
  _LoginScreenState createState() => _LoginScreenState();

  final bool hasTokenExpired;

  const LoginScreen([this.hasTokenExpired = false]);
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final FocusNode _usernameFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final ScrollController _scrollController = ScrollController();

  LoginBloc loginBloc = sl<LoginBloc>();

  bool _rememberMe = false;
  bool _obscureText = true;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    SharedPreferences sharedPreferences = sl<SharedPreferences>();
    if (sharedPreferences.getBool(IS_REMEMBER_ME_CHECKED) ?? false) {
      var sharedPrefsUsername = sharedPreferences.getString(STORED_USERNAME);
      var sharedPrefsPassword = sharedPreferences.getString(STORED_PASSWORD);
      setState(() {
        _rememberMe = true;
        _usernameController.text = sharedPrefsUsername;
        _passwordController.text = sharedPrefsPassword;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: false,
      backgroundColor: Colors.white,
      body: BlocConsumer<LoginBloc, LoginState>(
        cubit: loginBloc,
        builder: (context, state) {
          return GestureDetector(
              //Dismiss soft keyboard if user taps somewhere on the screen
              onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
              child: phoneLayout(context));
        },
        listener: (context, state) {
          if (state is LoginLoadingState) {
            _isLoading = true;
          } else if (state is LoginFailureState) {
            _isLoading = false;
            Scaffold.of(context).showSnackBar(SnackBar(
                content: new Text(state.error),
                duration: new Duration(seconds: 3)));
          }
        },
      ),
    );
  }

  Widget phoneLayout(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.statusBarHeight),
      child: Container(
        height: double.infinity,
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: Image(image: AssetImage('assets/dnc_def_logo.png')),
                ),
                Form(key: _formKey, child: _buildFormFields()),
                LoginButton(
                  'Log In',
                  isLoading: _isLoading,
                  onTap: () => _login(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormFields() {
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
      loginBloc.add(OnLoginButtonPressed(
        username: email,
        password: password,
        isRememberMeChecked: _rememberMe,
      ));
    }
  }

  Widget _buildUsernameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Username', style: loginLabelStyle),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: loginBoxDecorationStyle,
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
        Text('Password', style: loginLabelStyle),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: loginBoxDecorationStyle,
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
          Text('Memorizza credenziali', style: loginLabelStyle),
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
