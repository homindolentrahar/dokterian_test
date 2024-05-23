import 'package:dokterian_test/core/router/app_router.dart';
import 'package:dokterian_test/core/ui/theme/app_theme.dart';
import 'package:dokterian_test/feature/auth/presentation/bloc/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DokterianApp extends StatelessWidget {
  const DokterianApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit()),
      ],
      child: MaterialApp.router(
        title: "Dokterian",
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        routerDelegate: AppRouter.router.routerDelegate,
        routeInformationParser: AppRouter.router.routeInformationParser,
        routeInformationProvider: AppRouter.router.routeInformationProvider,
      ),
    );
  }
}
