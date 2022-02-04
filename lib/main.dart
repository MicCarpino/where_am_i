import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/data/repositories/auth_repository_impl.dart';
import 'package:where_am_i/domain/blocs/authentication/authentication_bloc.dart';
import 'package:where_am_i/injection_container.dart' as serviceLocator;
import 'package:where_am_i/presentation/home/home_screen.dart';
import 'package:where_am_i/presentation/login/login_screen.dart';
import 'package:where_am_i/presentation/login/splash_screen.dart';

//Flutter binding e get_it (DI) initialization
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
    // UI initialization
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: dncDarkBlue, // status bar color
    ));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    //retrieve instance of AuthenticationBloc
    return BlocProvider(
      create: (_) => serviceLocator.getIt<AuthenticationBloc>(),
      child: MaterialApp(
        navigatorKey: _navigatorKey,
        theme: ThemeData(
            //brightness: Brightness.light,
            primaryColor: dncBlue,
            appBarTheme: Theme.of(context)
                .appBarTheme
                .copyWith(backgroundColor: dncBlue)),
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
            //reacting to authentication state changes
            child: BlocListener<AuthenticationBloc, AuthenticationState>(
              //perform operation just when previous auth state differs from the newer one
              listenWhen: (p, c) =>
                  p.authenticationStatus != c.authenticationStatus,
              listener: (context, state) {
                switch (state.authenticationStatus) {
                  //user logged, show Home page
                  case AuthenticationStatus.authenticated:
                    _navigator.pushAndRemoveUntil<void>(
                      HomeScreen.route(),
                      (route) => false,
                    );
                    break;
                  case AuthenticationStatus.unauthenticated:
                    //user not logged, show Login page
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
