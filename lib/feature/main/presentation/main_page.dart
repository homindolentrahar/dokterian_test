import 'package:dokterian_test/core/router/app_router.dart';
import 'package:dokterian_test/feature/auth/presentation/bloc/auth_cubit.dart';
import 'package:dokterian_test/feature/auth/presentation/bloc/auth_state.dart';
import 'package:dokterian_test/feature/main/presentation/bloc/main_navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainPage extends StatefulWidget {
  final StatefulNavigationShell shell;

  const MainPage._({
    required this.shell,
  });

  @override
  State<MainPage> createState() => _MainPageState();

  static Widget createPage({required StatefulNavigationShell shell}) =>
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => MainNavigationCubit()),
        ],
        child: MainPage._(shell: shell),
      );
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (listenerCtx, state) {
        if (state.status == AuthStatus.unauthenticated) {
          listenerCtx.go(RoutePaths.login);
        }
      },
      child: BlocBuilder<MainNavigationCubit, int>(builder: (navCtx, index) {
        return Scaffold(
          bottomNavigationBar: SalomonBottomBar(
            currentIndex: index,
            backgroundColor: Theme.of(context).colorScheme.background,
            selectedItemColor: Theme.of(context).colorScheme.secondary,
            selectedColorOpacity: 0.1,
            itemShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 16,
            ),
            itemPadding: const EdgeInsets.all(12),
            onTap: (currentIndex) {
              navCtx
                  .read<MainNavigationCubit>()
                  .onNavigationChanged(currentIndex);

              widget.shell.goBranch(currentIndex);
            },
            items: navCtx
                .read<MainNavigationCubit>()
                .navItems
                .map(
                  (item) => SalomonBottomBarItem(
                    title: Text(
                      item.title,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: index == item.index
                              ? Theme.of(context).colorScheme.secondary
                              : Theme.of(context).colorScheme.background),
                    ),
                    icon: SvgPicture.asset(item.icon),
                    activeIcon: SvgPicture.asset(item.activeIcon),
                  ),
                )
                .toList(),
          ),
          body: SafeArea(child: widget.shell),
        );
      }),
    );
  }
}
