import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:where_am_i/core/error/failure.dart';
import 'package:where_am_i/core/usecases/usecase.dart';
import 'package:where_am_i/core/utils/aes_utils.dart';
import 'package:where_am_i/domain/entities/authenticated_user.dart';

import '../repositories/authentication_repository.dart';

class PerformLogIn extends UseCase<AuthenticatedUser, LoginParams> {
  final AuthenticationRepository _loginRepository;

  PerformLogIn(this._loginRepository);

  Future<Either<Failure, AuthenticatedUser>> call(LoginParams params) async {
    var iv = "bd6c7e4747a2962e38cfdcdf586cd7b9";
    var salt = "967c96f344f88e3ccaa512b6ae4d4247";
    var passPhrase = "7061737323313233";
    var aesUtils = AesUtils(128, 1000);
    var cipherText = aesUtils.encrypt(salt, iv, passPhrase, params.password);
    String aesPassword = (iv + "::" + salt + "::" + base64Encode(cipherText));
    var bytes = utf8.encode(aesPassword);
    String encryptedPassword = base64.encode(bytes);
    var result = await _loginRepository.performUserAuthentication(
      params.username,
      encryptedPassword,
    );
    if (result.isRight()) {
      params.isRememberChecked
          ? _loginRepository.storeCredentials(params.username, params.password)
          : _loginRepository.removeStoredCredentials();
    }
    return result;
  }
}

class LoginParams extends Equatable {
  final String username;
  final String password;
  final bool isRememberChecked;

  LoginParams({
    @required this.username,
    @required this.password,
    @required this.isRememberChecked,
  });

  @override
  List<Object> get props => [username, password];
}
