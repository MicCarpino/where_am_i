import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/data/datasources/local_data_source.dart';
import 'package:where_am_i/domain/repositories/authentication_repository.dart';
import 'package:where_am_i/injection_container.dart';
import 'package:where_am_i/presentation/login/login_desktop_form.dart';
import 'package:where_am_i/presentation/login/login_mobile_form.dart';
import 'package:where_am_i/presentation/responsive_builder.dart';
import 'package:where_am_i/domain/blocs/login/log_in_bloc.dart';

//Login page
class LoginScreen extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => LoginScreen());
  }

  //Build mobile or desktop login form and provide the login Bloc instance
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: false,
      backgroundColor: Colors.white,
      body: BlocProvider<LogInBloc>(
        create: (context) => LogInBloc(
          getIt<LocalDataSource>(),
          getIt<AuthenticationRepository>(),
        ),
        child: ResponsiveBuilder(
          mobile: LoginMobileForm(),
          tabletOrDesktop: LoginDesktopForm(),
        ),
      ),
    );
  }
}
