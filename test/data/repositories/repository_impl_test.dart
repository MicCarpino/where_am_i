import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:where_am_i/data/datasources/local_data_source.dart';
import 'package:where_am_i/data/datasources/remote_data_source.dart';
import 'package:where_am_i/data/models/authenticated_user_model.dart';
import 'package:where_am_i/data/models/user_model.dart';
import 'package:where_am_i/data/repositories/login_repository_impl.dart';

class MockRemoteDataSource extends Mock implements RemoteDataSource {}
class MockLocalDataSource extends Mock implements LocalDataSource {}

void main() {
  LoginRepositoryImpl loginRepository;
  MockRemoteDataSource mockRemoteDataSource;
  MockLocalDataSource mockLocalDataSource;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    loginRepository = LoginRepositoryImpl(remoteDataSource: mockRemoteDataSource, localDataSource: mockLocalDataSource);
  });

  group('get_authenticated_user', () {
    final tUserDetails = UserModel(
      idResource: "1",
      idRole: 3,
      username: "tUsername",
      name: "tName",
      surname: "tSurname",
    );
    final tUserModel = AuthenticatedUserModel(
        user: tUserDetails,
        authenticationToken: "abc",
        expiration: 100);
    test(
        'should return the user model when the authentication is successful', () async {
      when(mockRemoteDataSource.performUserAuthentication("username", "password"))
          .thenAnswer((_) async => tUserModel);

      final result = await loginRepository.performUserAuthentication(
          "username", "password");
      verify(
          mockRemoteDataSource.performUserAuthentication("username", "password"));
      expect(result, equals(Right(tUserModel)));
    });
  });
}