import 'package:dokterian_test/core/bloc/base_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(BaseStatus.initial) BaseStatus? status,
    String? data,
    @Default("") String message,
  }) = _LoginState;
}
