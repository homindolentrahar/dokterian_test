import 'package:dokterian_test/feature/auth/data/model/auth_response_model.dart';

class AuthResponse {
  final String token;

  AuthResponse({required this.token});

  factory AuthResponse.fromModel(AuthResponseModel model) {
    return AuthResponse(
      token: model.token ?? "",
    );
  }

  AuthResponseModel toModel() => AuthResponseModel(token: token);
}
