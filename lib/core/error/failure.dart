import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}


class ServerFailure extends Failure {
  ServerFailure(this.message);
  final String message;
}

class MachineFailure extends Failure {
  MachineFailure(this.message);
  final String message;
}

class ServerException extends Failure {

  ServerException(this.status,this.message);
  final bool status;
  final String message;
}

class CacheFailure extends Failure {}
