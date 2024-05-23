import 'package:dartz/dartz.dart';

abstract interface class AuthRepository {
  Future<Either<String, String>> login({
    required String username,
    required String password,
  });
}
