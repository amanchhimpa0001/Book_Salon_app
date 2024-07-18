class AppException implements Exception {
  final String _massege;
  final String _prifix;

  AppException(this._massege, this._prifix);

  @override
  String toString() {
 
    return "$_massege,$_prifix";
  }
}

class FetchdataException extends AppException {
  FetchdataException(String msg) : super(msg, "Error During Communitcation");
}

class NoInternetException extends AppException {
  NoInternetException(String msg) : super(msg, 'Error! No Internet');
}

class BadRequestException extends AppException {
  BadRequestException(String msg)
      : super(
          msg,
          "Bad Request",
        );
}

class SocketErrorException extends AppException {
  SocketErrorException(String msg)
      : super(msg, "No Internet Connection. Please try again later.");
}

class TimeoutException extends AppException {
  TimeoutException(String msg)
      : super(msg, "Request timed out. Please try again later.");
}

class UnaothorisedException extends AppException {
  UnaothorisedException(String msg) : super(msg, "Unaothorised reguest");
}

class InvalidInputException extends AppException {
  InvalidInputException(String msg) : super(msg, "Invlid Input");
}

class AuthException extends AppException {
  AuthException(String msg) : super(msg, "Auth Exception");
}
