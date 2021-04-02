import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/core/utils/styles.dart';
import 'package:where_am_i/domain/blocs/login/log_in_bloc.dart';
import 'package:where_am_i/domain/blocs/login/login_form_field.dart';

class LoginFormFieldWidget extends StatelessWidget {
  const LoginFormFieldWidget({
    @required this.label,
    @required this.textInputAction,
    @required this.focusNode,
    this.nextFocusNode,
    @required this.formField,
    this.obscureText,
    @required this.prefixIcon,
    this.suffixIcon,
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
              color: Colors.grey[300])
        ],
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      ),
      child: TextFormField(
        initialValue: formField.value,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        textInputAction: textInputAction,
        focusNode: focusNode,
        onChanged: (value) => onChanged(value),
        onFieldSubmitted: (term) => nextFocusNode != null
            ? nextFocusNode.requestFocus()
            : focusNode.unfocus(),
        obscureText: obscureText ?? false,
        keyboardType: TextInputType.text,
        style: TextStyle(color: Colors.black87),
        validator: (_) => formField.invalid ? '' : null,
        decoration: InputDecoration(
          fillColor: Colors.grey,
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
                    child: Icon(
                        obscureText ? Icons.visibility : Icons.visibility_off,
                        color: dncBlue),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
