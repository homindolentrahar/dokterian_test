import 'package:dartz/dartz.dart';
import 'package:dokterian_test/feature/auth/domain/dto/auth_response.dart';

abstract interface class AuthRepository {
  Future<Either<String, AuthResponse>> login({
    required String username,
    required String password,
  });
}
