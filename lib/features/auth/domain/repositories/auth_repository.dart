import 'package:dartz/dartz.dart';
import '../entities/user.dart';
import '../../../../core/error/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthResult>> signIn({
    required String identifier,
    required String password,
  });

  Future<Either<Failure, void>> signOut();
}
