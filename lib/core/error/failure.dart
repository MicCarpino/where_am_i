import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  Failure([List properties = const <dynamic>[]]);

    String getErrorMessageFromFailure();
}

// General failures
class ServerFailure extends Failure {
  final String errorMessage;

  ServerFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];

  @override
  String getErrorMessageFromFailure() {
    return this.errorMessage;
  }
}

class CacheFailure extends Failure {
  @override
  List<Object> get props => [];
  @override
  String getErrorMessageFromFailure() {
    return "Cache failure";
  }
}

class UnexpectedFailure extends Failure {
  final String errorMessage ;
  UnexpectedFailure (this.errorMessage);
  @override
  List<Object> get props => [errorMessage];

  @override
  String getErrorMessageFromFailure() {
    return this.errorMessage;
  }
}

