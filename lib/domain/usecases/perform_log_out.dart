import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

class PerformLogOut extends UseCase<void, void> {
  final AuthRepository loginRepository;

  PerformLogOut(this.loginRepository);

  Future<Either<Failure, void>> call(void params) async {
    return loginRepository.removeLoggedUser();
  }
}
