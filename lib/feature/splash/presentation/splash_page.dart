import 'package:dokterian_test/core/router/app_router.dart';
import 'package:dokterian_test/feature/auth/presentation/bloc/auth_cubit.dart';
import 'package:dokterian_test/feature/auth/presentation/bloc/auth_state.dart';
import 'package:dokterian_test/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (ctx, state) {
        if (state.status == AuthStatus.authenticated) {
          context.go(RoutePaths.home);
        } else {
          context.go(RoutePaths.login);
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Image.asset(
              Assets.images.loginImage.path,
              width: 240,
              height: 240,
            ),
          ),
        ),
      ),
    );
  }
}
