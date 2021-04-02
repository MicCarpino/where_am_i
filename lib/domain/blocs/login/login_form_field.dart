import 'package:formz/formz.dart';

 class LoginFormField extends FormzInput<String,String>{
  LoginFormField.pure([String value]) : super.pure(value ?? '');

  LoginFormField.dirty([String value = '']) : super.dirty(value);


  @override
  String validator(String value) {
  return value.isEmpty ? '' : null;
  }

}