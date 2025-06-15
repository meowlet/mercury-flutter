import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  final String? errorType;
  final Map<String, dynamic>? details;

  const ServerFailure(super.message, {this.errorType, this.details});

  @override
  List<Object?> get props => [message, errorType, details];
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

class UnknownFailure extends Failure {
  const UnknownFailure(super.message);
}
