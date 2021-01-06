import '../repositories/authentication_repository.dart';

class PerformLogOut {
  final AuthenticationRepository _authenticationRepository;

  PerformLogOut(this._authenticationRepository);

  call({bool tokenExpired = false}) async {
    _authenticationRepository.removeLoggedUser();
  }
}
