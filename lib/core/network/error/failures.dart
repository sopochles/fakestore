abstract class Failure {
  final String errorMessage;
  final int? statusCode;

  Failure(this.errorMessage, this.statusCode);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage, super.statusCode);
}
