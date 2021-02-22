import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/data/repositories/auth_repository_impl.dart';
import 'package:where_am_i/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:where_am_i/presentation/pages/my_presences_page.dart';
import 'package:where_am_i/presentation/screen/splash_screen.dart';
import 'package:where_am_i/presentation/bloc/login/login_bloc.dart';
import 'package:where_am_i/presentation/screen/home_screen.dart';
import 'package:where_am_i/presentation/screen/login_screen.dart';
import 'injection_container.dart' as serviceLocator;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Intl.defaultLocale = 'it_IT';
  await serviceLocator.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: dncDarkBlue, // status bar color
    ));
    return BlocProvider(
      create: (_) => serviceLocator.getIt<AuthenticationBloc>(),
      child: MaterialApp(
        navigatorKey: _navigatorKey,
        theme: ThemeData(primarySwatch: Colors.lightBlue),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', ''),
          const Locale('it', ''),
        ],
        builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: BlocListener<AuthenticationBloc, AuthenticationState>(
              listener: (context, state) {
                switch (state.authenticationStatus) {
                  case AuthenticationStatus.authenticated:
                    _navigator.pushAndRemoveUntil<void>(
                      HomeScreen.route(),
                      (route) => false,
                    );
                    break;
                  case AuthenticationStatus.unauthenticated:
                    _navigator.pushAndRemoveUntil<void>(
                      LoginScreen.route(),
                      (route) => false,
                    );
                    break;
                  default:
                    break;
                }
              },
              child: child,
            )),
        onGenerateRoute: (_) => SplashScreen.route(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
