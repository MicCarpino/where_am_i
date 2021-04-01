import 'package:formz/formz.dart';
import 'package:where_am_i/core/error/failure.dart';

 class LoginFormField extends FormzInput<String,Failure>{
  LoginFormField.pure([String value]) : super.pure(value ?? '');

  LoginFormField.dirty([String value = '']) : super.dirty(value);

  @override
  Failure validator(String value) {
    return value.isEmpty ? UnexpectedFailure('empty') : null;
  }
}