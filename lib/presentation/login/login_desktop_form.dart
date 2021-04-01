import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/core/utils/styles.dart';
import 'package:where_am_i/presentation/login/login_button.dart';
import 'package:where_am_i/presentation/login/login_form_field_widget.dart';
import 'package:where_am_i/presentation/responsive_builder.dart';
import 'package:where_am_i/domain/blocs/login/log_in_bloc.dart';

class LoginDesktopForm extends StatelessWidget {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final FocusNode _usernameFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LogInBloc, LogInState>(
      builder: (context, state) => Center(
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Image(image: AssetImage('assets/dnc_def_logo.png')),
                ),
                SizedBox(height: 48),
                LoginFormFieldWidget(
                  controller: _usernameController,
                  label: 'Username',
                  focusNode: _usernameFocus,
                  nextFocusNode: _passwordFocus,
                  textInputAction: TextInputAction.next,
                  prefixIcon: Icons.person,
                ),
                SizedBox(height: 24),
                LoginFormFieldWidget(
                  controller: _passwordController,
                  label: 'Password',
                  focusNode: _passwordFocus,
                  textInputAction: TextInputAction.done,
                  prefixIcon: Icons.lock,
                  obscureText: state.isPasswordVisible,
                  suffixIcon: state.isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
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
                LoginButton(
                  'Log In',
                  isLoading: state.isLoading,
                  onTap: () =>
                      context.read<LogInBloc>().add(LogInEvent.performLogin()),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
