import 'package:hebauto/core/error/failure.dart';

extension FailureExtension on Failure {
  /// get int value from bool
  String getErrorMessage() {
    if (this is ServerFailure) {
      return (this as ServerFailure).message;
    } else if (this is ServerException) {
      return (this as ServerException).message;
    } else {
      return 'Unknown error occurred';
    }
  }
}
