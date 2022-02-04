import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/core/utils/styles.dart';
import 'package:where_am_i/presentation/login/login_button.dart';
import 'package:where_am_i/presentation/login/login_form_field_widget.dart';
import 'package:where_am_i/presentation/responsive_builder.dart';
import 'package:where_am_i/domain/blocs/login/log_in_bloc.dart';

class LoginDesktopForm extends StatelessWidget {
  final FocusNode _usernameFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(48),
          width: MediaQuery.of(context).size.width /
              (ResponsiveBuilder.isWebOrDesktop(context) ? 3 : 2),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 10,
                  blurRadius: 70),
            ],
          ),
          child: BlocBuilder<LogInBloc, LogInState>(
            builder: (context, state) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Image(image: AssetImage('assets/dnc_def_logo.png')),
                ),
                SizedBox(height: 48),
                LoginFormFieldWidget(
                  formField: state.username,
                  label: 'Username',
                  focusNode: _usernameFocus,
                  nextFocusNode: _passwordFocus,
                  textInputAction: TextInputAction.next,
                  prefixIcon: Icons.person,
                  onChanged: (username) => context
                      .read<LogInBloc>()
                      .add(LogInEvent.usernameChanged(username)),
                ),
                SizedBox(height: 24),
                LoginFormFieldWidget(
                  formField: state.password,
                  label: 'Password',
                  focusNode: _passwordFocus,
                  textInputAction: TextInputAction.done,
                  prefixIcon: Icons.lock,
                  obscureText: state.isPasswordHidden,
                  suffixIcon: state.isPasswordHidden
                      ? Icons.visibility_off
                      : Icons.visibility,
                  onChanged: (password) => context
                      .read<LogInBloc>()
                      .add(LogInEvent.passwordChanged(password)),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Checkbox(
                      value: state.isRememberMeChecked,
                      checkColor: Colors.white,
                      activeColor: dncBlue,
                      onChanged: (value) => context
                          .read<LogInBloc>()
                          .add(LogInEvent.rememberMeChanged()),
                    ),
                    Text('Memorizza credenziali', style: loginLabelStyle),
                  ],
                ),
                SizedBox(height: 16),
                LoginButton(isLoading: state.isLoading),
                // in the tablet/desktop/web version login errors are shown in a
                // "fixed box" below the login form
                SizedBox(height: 16),
                state.loginFailureOrSuccess.fold(
                  //option none : nothing to show
                  () => Container(),
                  //option some : there's a login result
                  (leftOrRight) => leftOrRight.fold(
                    //either left (failure): retrieve and show the login error from the failure
                      (failure) => Container(alignment: Alignment.center,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.red.withOpacity(0.25),
                              border: Border.all(color: Colors.red[500]),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 24.0),
                            child: Text(failure),
                          )),
                      //either right : login successful, navigation to home page will occur now
                      (_) => Container()),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
