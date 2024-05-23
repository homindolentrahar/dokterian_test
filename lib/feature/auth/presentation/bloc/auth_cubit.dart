import 'package:dokterian_test/app_injection.dart';
import 'package:dokterian_test/core/util/secure_storage_manager.dart';
import 'package:dokterian_test/feature/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState()) {
    checkAuth();
  }

  Future<void> checkAuth() async {
    Future.delayed(const Duration(seconds: 2), () async {
      final token = await injector.get<SecureStorageManager>().getToken();

      if (token != null && token.isNotEmpty) {
        _setAuthenticated(token);
      } else {
        _setUnauthenticated();
      }
    });
  }

  Future<void> authenticate(String token) async {
    await injector.get<SecureStorageManager>().saveToken(token);

    _setAuthenticated(token);
  }

  Future<void> logout() async {
    await injector.get<SecureStorageManager>().removeToken();

    _setUnauthenticated();
  }

  void _setAuthenticated(String token) {
    emit(state.copyWith(status: AuthStatus.authenticated, token: token));
  }

  void _setUnauthenticated() async {
    emit(state.copyWith(status: AuthStatus.unauthenticated));
  }
}
