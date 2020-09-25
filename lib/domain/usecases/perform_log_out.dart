import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../core/usecases/usecase.dart';
import '../repositories/login_repository.dart';

class PerformLogOut extends UseCase<void, void> {
  final LoginRepository loginRepository;

  PerformLogOut(this.loginRepository);

  Future<Either<Failure, void>> call(void params) async {
    return loginRepository.removeLoggedUser();
  }
}
