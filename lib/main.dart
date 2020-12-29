import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:where_am_i/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:where_am_i/presentation/bloc/authentication/authentication_state.dart';
import 'package:where_am_i/presentation/screen/home_screen.dart';
import 'package:where_am_i/presentation/screen/login_screen.dart';
import 'injection_container.dart' as serviceLocator;

import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/presentation/screen/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Intl.defaultLocale = 'it_IT';
  await serviceLocator.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // ignore: close_sinks
  final AuthenticationBloc loginBloc = serviceLocator.sl<AuthenticationBloc>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: dncDarkBlue, // status bar color
    ));
    return MaterialApp(
        builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child),
        localizationsDelegates: [
          // ... app-specific localization delegate[s] here
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', ''), // English, no country code
          const Locale('it', ''), // Hebrew, no country code
        ],
        theme: ThemeData(primarySwatch: Colors.lightBlue),
        home: BlocConsumer<AuthenticationBloc, AuthenticationState>(
          cubit: loginBloc,
          buildWhen: (previous, current) => current is AuthenticationInitialState,
          builder: (context, state) {
            return BlocProvider<AuthenticationBloc>.value(
                value: loginBloc, child: SplashScreen());
          },
          listenWhen: (previous, current) => previous!=current,
          listener: (context, state) {
            if (state is LoggedInState) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (newContext) =>
                    BlocProvider<AuthenticationBloc>.value(
                        value: loginBloc, child: HomeScreen())),
              );
            } else if (state is LoggedOutState) {
              print('logged out state trigger on main file');
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (newContext) =>
                    BlocProvider<AuthenticationBloc>.value(
                        value: loginBloc, child: LoginScreen(state.hasTokenExpired))),
              );
            }
          },
        ));
  }
}
