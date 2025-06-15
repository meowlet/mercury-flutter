import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/sign_in_usecase.dart';
import '../../domain/usecases/sign_out_usecase.dart';
import '../../domain/usecases/check_auth_usecase.dart';
import '../../../../core/error/failures.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInUseCase signInUseCase;
  final SignOutUseCase signOutUseCase;
  final CheckAuthUseCase checkAuthUseCase;

  AuthBloc({
    required this.signInUseCase,
    required this.signOutUseCase,
    required this.checkAuthUseCase,
  }) : super(AuthInitial()) {
    on<SignInRequested>(_onSignInRequested);
    on<SignOutRequested>(_onSignOutRequested);
    on<AuthCheckRequested>(_onAuthCheckRequested);
  }

  void _onSignInRequested(
    SignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    final result = await signInUseCase.call(
      identifier: event.identifier,
      password: event.password,
    );

    result.fold(
      (failure) {
        String errorType = '';
        if (failure is ServerFailure) {
          errorType = failure.errorType ?? '';
        }
        emit(AuthError(message: failure.message, errorType: errorType));
      },
      (authResult) {
        emit(AuthAuthenticated(authResult: authResult));
      },
    );
  }

  void _onSignOutRequested(
    SignOutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    final result = await signOutUseCase.call();

    result.fold(
      (failure) {
        emit(AuthError(message: failure.message));
      },
      (_) {
        emit(AuthUnauthenticated());
      },
    );
  }

  void _onAuthCheckRequested(
    AuthCheckRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    final result = await checkAuthUseCase.call();

    result.fold(
      (failure) {
        emit(AuthUnauthenticated());
      },
      (authResult) {
        if (authResult != null) {
          emit(AuthAuthenticated(authResult: authResult));
        } else {
          emit(AuthUnauthenticated());
        }
      },
    );
  }
}
