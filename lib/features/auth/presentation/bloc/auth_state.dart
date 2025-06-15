import 'package:equatable/equatable.dart';
import '../../domain/entities/user.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final AuthResult authResult;

  const AuthAuthenticated({required this.authResult});

  @override
  List<Object?> get props => [authResult];
}

class AuthUnauthenticated extends AuthState {}

class AuthError extends AuthState {
  final String message;
  final String? errorType;

  const AuthError({required this.message, this.errorType});

  @override
  List<Object?> get props => [message, errorType];
}
