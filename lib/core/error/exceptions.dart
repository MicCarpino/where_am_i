class ServerException implements Exception {
  final String errorMessage;

  ServerException(this.errorMessage);
}

class CacheException implements Exception {}

class UnauthorizedException implements Exception {}

class UnexpectedException implements Exception {
  final String errorMessage;

  UnexpectedException(this.errorMessage);
}
