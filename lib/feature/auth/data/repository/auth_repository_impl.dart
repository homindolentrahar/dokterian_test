import 'package:dartz/dartz.dart';
import 'package:dokterian_test/core/data/remote/api_client.dart';
import 'package:dokterian_test/feature/auth/data/model/auth_response_model.dart';
import 'package:dokterian_test/feature/auth/domain/dto/auth_response.dart';
import 'package:dokterian_test/feature/auth/domain/repository/auth_repository.dart';
import 'package:flutter/material.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ApiClient client;

  AuthRepositoryImpl(this.client);

  @override
  Future<Either<String, AuthResponse>> login({
    required String username,
    required String password,
  }) async {
    try {
      final result = await client.requestObject<AuthResponseModel>(
        endpoint: "/login",
        method: ApiMethod.post,
        body: {
          "username": username,
          "password": password,
        },
      );

      if (result.metadata?.status == 200) {
        return right(AuthResponse.fromModel(result.response!.data!));
      } else {
        throw result.metadata?.message ?? "error occurred";
      }
    } catch (error) {
      debugPrint("error: $error");
      return left(error.toString());
    }
  }
}
