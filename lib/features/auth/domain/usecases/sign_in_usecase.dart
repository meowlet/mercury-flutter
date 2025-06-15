import 'package:dartz/dartz.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';
import '../../../../core/error/failures.dart';

class SignInUseCase {
  final AuthRepository repository;

  SignInUseCase(this.repository);

  Future<Either<Failure, AuthResult>> call({
    required String identifier,
    required String password,
  }) async {
    return await repository.signIn(identifier: identifier, password: password);
  }
}
