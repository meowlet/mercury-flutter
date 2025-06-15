import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String username;
  final String email;
  final bool isPremium;

  const User({
    required this.id,
    required this.username,
    required this.email,
    required this.isPremium,
  });

  @override
  List<Object?> get props => [id, username, email, isPremium];
}

class AuthTokens extends Equatable {
  final String accessToken;
  final String refreshToken;

  const AuthTokens({required this.accessToken, required this.refreshToken});

  @override
  List<Object?> get props => [accessToken, refreshToken];
}

class AuthResult extends Equatable {
  final User user;
  final AuthTokens tokens;

  const AuthResult({required this.user, required this.tokens});

  @override
  List<Object?> get props => [user, tokens];
}
