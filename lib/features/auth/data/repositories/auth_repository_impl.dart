import 'package:dartz/dartz.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/services/auth_storage_service.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthStorageService storageService;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.storageService,
  });

  @override
  Future<Either<Failure, AuthResult>> signIn({
    required String identifier,
    required String password,
  }) async {
    try {
      final result = await remoteDataSource.signIn(
        identifier: identifier,
        password: password,
      );

      // Save authentication data locally
      await storageService.saveAuthTokens(result.tokens);
      await storageService.saveUser(result.user);

      return Right(result);
    } on Failure catch (failure) {
      return Left(failure);
    } catch (e) {
      return Left(UnknownFailure('Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      // Clear local authentication data
      await storageService.clearAuthData();

      // Note: You might want to call a remote signOut endpoint here
      // if your API requires it for token invalidation

      return const Right(null);
    } catch (e) {
      return Left(UnknownFailure('Sign out failed: $e'));
    }
  }
}
