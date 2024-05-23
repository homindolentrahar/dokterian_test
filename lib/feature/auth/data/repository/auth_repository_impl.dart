import 'package:dartz/dartz.dart';
import 'package:dokterian_test/core/data/remote/api_client.dart';
import 'package:dokterian_test/feature/auth/domain/repository/auth_repository.dart';
import 'package:flutter/material.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ApiClient client;

  AuthRepositoryImpl(this.client);

  @override
  Future<Either<String, String>> login({
    required String username,
    required String password,
  }) async {
    try {
      final result = await client.requestObject<String>(
        endpoint: "/login",
        method: ApiMethod.post,
        body: {
          "username": username,
          "password": password,
        },
      );

      if (result.metadata?.status == 200) {
        return right(result.response?.data ?? "");
      } else {
        throw result.metadata?.message ?? "error occurred";
      }
    } catch (error) {
      debugPrint("error: $error");
      return left(error.toString());
    }
  }
}
