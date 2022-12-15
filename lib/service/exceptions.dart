import '../util/constants.dart';

class AppException implements Exception {
  final _message;
  final _prefix;

  AppException(this._message, this._prefix);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException(String message)
      : super(message, Constants.fetchExceptionMessage);
}

class BadRequestException extends AppException {
  BadRequestException([message])
      : super(message, Constants.badRequestExceptionMessage);
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message])
      : super(message, Constants.unauthorisedExceptionMessage);
}

class InvalidInputException extends AppException {
  InvalidInputException(message)
      : super(message, Constants.unvalidInputExceptionMessage);
}
