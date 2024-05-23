import 'package:dokterian_test/feature/auth/presentation/bloc/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LoginPage extends StatefulWidget {
  const LoginPage._();

  @override
  State<LoginPage> createState() => _LoginPageState();

  static Widget createPage() => MultiBlocProvider(
        providers: const [],
        child: const LoginPage._(),
      );
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final controller = context.read<LoginCubit>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: FormBuilder(
            key: controller.formKey,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [],
            ),
          ),
        ),
      ),
    );
  }
}
