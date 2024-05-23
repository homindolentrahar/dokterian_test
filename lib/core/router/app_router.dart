import 'package:dokterian_test/feature/auth/presentation/login/login_page.dart';
import 'package:dokterian_test/feature/main/presentation/main_page.dart';
import 'package:dokterian_test/feature/splash/presentation/splash_page.dart';
import 'package:go_router/go_router.dart';

abstract class RoutePaths {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String main = '/main';
  static const String home = '$main/home';
  static const String schedule = '$main/schedule';
}

abstract class AppRouter {
  static final router = GoRouter(
    initialLocation: RoutePaths.splash,
    routes: [
      GoRoute(
        path: RoutePaths.splash,
        builder: (ctx, state) => const SplashPage(),
      ),
      GoRoute(
        path: RoutePaths.login,
        builder: (ctx, state) => LoginPage.createPage(),
      ),
      GoRoute(
        path: RoutePaths.main,
        builder: (ctx, state) => const MainPage(),
      ),
    ],
  );
}
