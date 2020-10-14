import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:where_am_i/domain/entities/authenticated_user.dart';
import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/domain/repositories/auth_repository.dart';
import 'package:where_am_i/domain/usecases/perform_log_in.dart';

class MockLoginRepository extends Mock implements AuthRepository {}

void main() {
  PerformLogIn usecase;
  MockLoginRepository mockLoginRepository;

  setUp(() {
    mockLoginRepository = MockLoginRepository();
    usecase = PerformLogIn(mockLoginRepository);
  });

  final tUser = User(
    idResource: 1,
    idRole: 1,
    name: "tName",
    surname: "tSurname",
  );

  final tUsername = "inUsername";
  final tPassword = "inPassword";
  final tAuthUser = AuthenticatedUser(
    user: tUser,
    authenticationToken: "tToken",
    expiration: 100,
  );

  test('should get the authenticated user object when remote auth succeed', () async {
    when(mockLoginRepository.performUserAuthentication(any, any))
        .thenAnswer((_) async => Right(tAuthUser));

    final result = await usecase(LoginParams(username: tUsername,password: tPassword));

    expect(result, Right(tUser));
    verify(mockLoginRepository.performUserAuthentication(tUsername, tPassword));
    verifyNoMoreInteractions(mockLoginRepository);
  });

}
