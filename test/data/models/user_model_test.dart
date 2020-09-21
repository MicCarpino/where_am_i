import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:where_am_i/data/models/user_model.dart';
import 'package:where_am_i/domain/entities/user.dart';

import '../../mocks/mock_reader.dart';

void main() {
  final tUserDetailsModel = UserDetailsModel(
      idResource: "1",
      idRole: 3,
      username: "tUsername",
      name: "tName",
      surname: "tSurname");
  final tUserModel = UserModel(
      userDetails: tUserDetailsModel,
      authenticationToken: "ahhvjs",
      expiration: 100);

  test('should be a subclass of User entity', () async {
    expect(tUserModel, isA<User>());
  });

  group('fromJson', () {
    test('should return a valid user model when the authentication is successful',
        () async {
      final Map<String, dynamic> jsonMap =
          json.decode(mockFile('authentication_success.json'));
      final result = UserModel.fromJson(jsonMap);
      expect(result, tUserModel);
    });
  });

  group('toJson', () {
    test(
      'should return a JSON map containing the proper user object',
          () async {
        // act
        final result = tUserModel.toJson();
        // assert
        final expectedJsonMap = {
          "user": {
            "idResource": "1",
            "idRole": 3,
            "username": "tUsername",
            "surname": "tSurname",
            "name": "tName",
          },
          "token": "ahhvjs",
          "expiration": 100
        };
        expect(result, expectedJsonMap);
      },
    );
  });
}
