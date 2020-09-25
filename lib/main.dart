import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'injection_container.dart' as di;

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:where_am_i/presentation/pages/home_screen.dart';
import 'package:where_am_i/presentation/pages/login_screen.dart';
import 'package:where_am_i/presentation/pages/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: dncDarkBlue, // status bar color
    ));
    return MaterialApp(
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
      home: SplashScreen(),
      /*routes: <String, WidgetBuilder>{
        SPLASH_SCREEN_KEY: (BuildContext context) => SplashScreen(),
        LOGIN_SCREEN_KEY: (BuildContext context) => LoginScreen(),
        HOME_SCREEN_KEY: (BuildContext context) => HomeScreen(),
      },*/
    );
  }
}
