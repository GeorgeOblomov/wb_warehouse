enum ErrorCode {
  serverUnreachable,
  unhandledError,
  serverError,
  badRequest,
  unauthorized,
  permissionDenied,
  notFound,
  serverUnavailable,
  internalServerError,
}

class DataError implements Exception {
  final ErrorCode? errorCode;
  final String? message;

  DataError({
    required this.errorCode,
    this.message,
  });

  @override
  String toString() => 'DataError. '
      'errorCode: $errorCode. '
      'message: $message. ';
}
