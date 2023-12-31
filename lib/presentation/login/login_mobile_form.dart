import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/core/utils/styles.dart';
import 'package:where_am_i/presentation/login/login_button.dart';
import 'package:where_am_i/presentation/login/login_form_field_widget.dart';
import 'package:where_am_i/domain/blocs/login/log_in_bloc.dart';

import '../responsive_builder.dart';

class LoginMobileForm extends StatelessWidget {
  final FocusNode _usernameFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) =>
            SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: BlocConsumer<LogInBloc, LogInState>(
              //show error message in the Flushbar if login fails
              listener: (context, state) => state.loginFailureOrSuccess.fold(
                //option none : nothing to show
                  () {},
                  //option some : there's a login result
                  (leftOrRight) => leftOrRight.fold(
                    //either left (failure): retrieve and show the login error from the failure
                        (failure) => ResponsiveBuilder.showsErrorMessage(context, failure),
                    //either right : login successful, navigation to home page will occur now
                        (_) {},
                      )),
              builder: (context, state) {
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(height: constraints.maxHeight * 0.1),
                    Image(
                      width: constraints.maxWidth * 0.9,
                      image: AssetImage('assets/dnc_def_logo.png'),
                    ),
                    SizedBox(height: constraints.maxHeight * 0.15),
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
                    SizedBox(height: 36),
                    LoginFormFieldWidget(
                      formField: state.password,
                      label: 'Password',
                      focusNode: _passwordFocus,
                      textInputAction: TextInputAction.done,
                      prefixIcon: Icons.lock,
                      obscureText: state.isPasswordHidden,
                      suffixIcon: state.isPasswordHidden
                          ? Icons.visibility
                          : Icons.visibility_off,
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
                    LoginButton(isLoading: state.isLoading)
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
