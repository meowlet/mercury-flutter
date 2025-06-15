import 'package:dartz/dartz.dart';
import '../entities/user.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/services/auth_storage_service.dart';

class CheckAuthUseCase {
  final AuthStorageService storageService;

  CheckAuthUseCase(this.storageService);

  Future<Either<Failure, AuthResult?>> call() async {
    try {
      final isAuthenticated = await storageService.isUserAuthenticated();

      if (!isAuthenticated) {
        return const Right(null);
      }

      final user = await storageService.getUser();
      final tokens = await storageService.getAuthTokens();

      if (user != null && tokens != null) {
        return Right(AuthResult(user: user, tokens: tokens));
      }

      return const Right(null);
    } catch (e) {
      return Left(UnknownFailure('Auth check failed: $e'));
    }
  }
}
