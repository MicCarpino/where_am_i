import 'package:formz/formz.dart';

//https://pub.dev/packages/formz

// this class handle the login input field validation logic
 class LoginFormField extends FormzInput<String,String>{
  //pure represent an unmodified form input
  LoginFormField.pure([String value]) : super.pure(value ?? '');
  //dirty represent an modified form input
  LoginFormField.dirty([String value = '']) : super.dirty(value);


  @override
  String validator(String value) {
   //define validation logic, in this case the field is valid if not null or empty
  return value.isEmpty ? '' : null;
  }

}