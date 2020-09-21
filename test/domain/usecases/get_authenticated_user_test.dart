import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:where_am_i/core/error/failure.dart';

import 'package:where_am_i/domain/entities/user.dart';
import 'package:where_am_i/domain/repositories/login_repository.dart';
import 'package:where_am_i/domain/usecases/get_remote_user.dart';

class MockLoginRepository extends Mock implements LoginRepository {}

void main() {
  GetAuthenticatedUser usecase;
  MockLoginRepository mockLoginRepository;

  setUp(() {
    mockLoginRepository = MockLoginRepository();
    usecase = GetAuthenticatedUser(mockLoginRepository);
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

  test('should retrieve the authenticated user object', () async {
    when(mockLoginRepository.performUserAuthentication(any, any))
        .thenAnswer((_) async => Right(tUser));

    final result = await usecase(Params(username: tUsername,password: tPassword));

    expect(result, Right(tUser));
    verify(mockLoginRepository.performUserAuthentication(tUsername, tPassword));
    verifyNoMoreInteractions(mockLoginRepository);
  });

}
