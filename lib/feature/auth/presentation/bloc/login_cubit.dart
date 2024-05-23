import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LoginCubit extends Cubit<String> {
  LoginCubit(super.initialState);

  final formKey = GlobalKey<FormBuilderState>();
}
