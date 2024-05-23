import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

enum AuthStatus {
  initial("Initial"),
  firstInstall("First Install"),
  authenticated("Authenticated"),
  unauthenticated("Unauthenticated");

  final String name;

  const AuthStatus(this.name);
}

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(AuthStatus.initial) AuthStatus status,
    String? token,
  }) = _AuthState;
}
