import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/core/utils/styles.dart';
import 'package:where_am_i/domain/blocs/login/log_in_bloc.dart';
import 'package:where_am_i/domain/blocs/login/login_form_field.dart';

//Widget for login username and password input fields
//This widget just render the UI based on the LoginState value and the only action
//it performs is adding an event, defined via callback, to the LoginBloc,
//which is responsible for the validation/logic
class LoginFormFieldWidget extends StatelessWidget {
  const LoginFormFieldWidget({
    //field placeholder
    @required this.label,
    //keyboard action button appearance and behavior
    @required this.textInputAction,
    //this widget focus node
    @required this.focusNode,
    //the next widget focus node
    this.nextFocusNode,
    //the Formz object related to this widget
    @required this.formField,
    //for the password field, show/hide the text and change the "show password" icon
    this.obscureText,
    //icon on left size
    @required this.prefixIcon,
    //icon on right size, used for the password field
    this.suffixIcon,
    //callback when the text changes
    @required this.onChanged,
  });

  final String label;
  final TextInputAction textInputAction;
  final FocusNode focusNode;
  final FocusNode nextFocusNode;
  final LoginFormField formField;
  final bool obscureText;
  final IconData prefixIcon;
  final IconData suffixIcon;
  final Function(String password) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 2),
            color: Colors.grey[300],
          )
        ],
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      ),
      child: TextFormField(
        //every time the login state changes this widget is rebuilt so, to reflect
        // text changes, it's sufficient to set the initial value
        initialValue: formField.value,
        autovalidateMode: AutovalidateMode.always,
        textInputAction: textInputAction,
        focusNode: focusNode,
        //when the text changes the callback, which is an "add" event to the block, is performed
        onChanged: (value) => onChanged(value),
        //on keyboard action set focus to next node, if present, or just unfocus
        onFieldSubmitted: (term) => nextFocusNode != null
            ? nextFocusNode.requestFocus()
            : focusNode.unfocus(),
        //show/hide password
        obscureText: obscureText ?? false,
        keyboardType: TextInputType.text,
        style: TextStyle(color: Colors.black87),
        //show red error border with no message on invalid value
        validator: (_) => formField.invalid ? '' : null,
        //disable the field if the authentication is in progress
        enabled: !context.read<LogInBloc>().state.isLoading,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: loginLabelStyle,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(style: BorderStyle.none)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(style: BorderStyle.none)),
          focusedErrorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          errorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          errorStyle: const TextStyle(height: 0),
          prefixIcon: Icon(prefixIcon, color: dncBlue),
          suffixIcon: suffixIcon != null
              ? MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => context
                        .read<LogInBloc>()
                        .add(LogInEvent.passwordVisibilityChanged()),
                    child: Icon(suffixIcon, color: dncBlue),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
