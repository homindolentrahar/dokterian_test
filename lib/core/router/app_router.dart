import 'package:dokterian_test/feature/auth/presentation/login/login_page.dart';
import 'package:dokterian_test/feature/main/presentation/home/home_page.dart';
import 'package:dokterian_test/feature/main/presentation/jadwal/jadwal_page.dart';
import 'package:dokterian_test/feature/main/presentation/main_page.dart';
import 'package:dokterian_test/feature/splash/presentation/splash_page.dart';
import 'package:go_router/go_router.dart';

abstract class RoutePaths {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String schedule = '/schedule';
  static const String chat = '/chat';
  static const String profile = '/profile';
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
      StatefulShellRoute.indexedStack(
        builder: (ctx, state, navigationShell) =>
            MainPage.createPage(shell: navigationShell),
        branches: [
          StatefulShellBranch(
            initialLocation: RoutePaths.home,
            routes: [
              GoRoute(
                path: RoutePaths.home,
                pageBuilder: (ctx, state) => NoTransitionPage(
                  child: HomePage.createPage(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            initialLocation: RoutePaths.schedule,
            routes: [
              GoRoute(
                path: RoutePaths.schedule,
                pageBuilder: (ctx, state) => const NoTransitionPage(
                  child: JadwalPage(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            initialLocation: RoutePaths.chat,
            routes: [
              GoRoute(
                path: RoutePaths.chat,
                pageBuilder: (ctx, state) => NoTransitionPage(
                  child: HomePage.createPage(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            initialLocation: RoutePaths.profile,
            routes: [
              GoRoute(
                path: RoutePaths.profile,
                pageBuilder: (ctx, state) => const NoTransitionPage(
                  child: JadwalPage(),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
