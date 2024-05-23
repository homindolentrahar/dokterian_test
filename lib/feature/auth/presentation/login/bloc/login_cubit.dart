import 'dart:developer';

import 'package:dokterian_test/core/bloc/base_status.dart';
import 'package:dokterian_test/core/util/extension/form_ext.dart';
import 'package:dokterian_test/feature/auth/domain/repository/auth_repository.dart';
import 'package:dokterian_test/feature/auth/presentation/login/bloc/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.authRepository}) : super(const LoginState());

  final AuthRepository authRepository;
  final formKey = GlobalKey<FormBuilderState>();

  Future<void> login() async {
    if (formKey.currentState?.saveAndValidate() ?? false) {
      emit(state.copyWith(status: BaseStatus.loading));

      final formData = formKey.getFormData();
      debugPrint("Form: $formData");

      final result = await authRepository.login(
        username: formData['username'],
        password: formData['password'],
      );

      result.fold(
        (err) {
          log("error: $err");

          emit(state.copyWith(status: BaseStatus.failure, message: err));
        },
        (response) {
          log("token: $response");

          emit(state.copyWith(status: BaseStatus.success, data: response));
        },
      );
    }
  }
}
