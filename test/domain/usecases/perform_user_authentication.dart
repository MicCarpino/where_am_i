import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:where_am_i/core/error/failure.dart';

import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/domain/repositories/login_repository.dart';
import 'package:where_am_i/domain/usecases/perform_user_authentication.dart';

class MockLoginRepository extends Mock implements LoginRepository {}

void main() {
  PerformUserAuthentication usecase;
  MockLoginRepository mockLoginRepository;

  setUp(() {
    mockLoginRepository = MockLoginRepository();
    usecase = PerformUserAuthentication(mockLoginRepository);
  });

  final tUserDetails = UserDetails(
    idResource: "1",
    idRole: 1,
    username: "tUsername",
    name: "tName",
    surname: "tSurname",
  );

  final tUsername = "inUsername";
  final tPassword = "inPassword";
  final tUser = User(
    userDetails: tUserDetails,
    authenticationToken: "tToken",
    expiration: 100,
  );

  test('should get the authenticated user object when remote auth succeed', () async {
    when(mockLoginRepository.performUserAuthentication(any, any))
        .thenAnswer((_) async => Right(tUser));

    final result = await usecase(LoginParams(username: tUsername,password: tPassword));

    expect(result, Right(tUser));
    verify(mockLoginRepository.performUserAuthentication(tUsername, tPassword));
    verifyNoMoreInteractions(mockLoginRepository);
  });

}
