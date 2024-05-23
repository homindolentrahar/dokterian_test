import 'package:dokterian_test/core/router/app_router.dart';
import 'package:dokterian_test/generated/assets.gen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainNavigationItem {
  final int index;
  final String title;
  final String route;
  final String icon;
  final String activeIcon;

  MainNavigationItem({
    required this.index,
    required this.title,
    required this.route,
    required this.icon,
    required this.activeIcon,
  });
}

class MainNavigationCubit extends Cubit<int> {
  MainNavigationCubit() : super(0);

  List<MainNavigationItem> navItems = [
    MainNavigationItem(
      index: 0,
      title: "Home",
      route: RoutePaths.home,
      icon: Assets.icons.icHome,
      activeIcon: Assets.icons.icHomeActive,
    ),
    MainNavigationItem(
      index: 1,
      title: "Jadwal",
      route: RoutePaths.schedule,
      icon: Assets.icons.icSchedule,
      activeIcon: Assets.icons.icScheduleActive,
    ),
    MainNavigationItem(
      index: 2,
      title: "Chat",
      route: RoutePaths.chat,
      icon: Assets.icons.icChat,
      activeIcon: Assets.icons.icChat,
    ),
    MainNavigationItem(
      index: 3,
      title: "Profil",
      route: RoutePaths.profile,
      icon: Assets.icons.icProfile,
      activeIcon: Assets.icons.icProfile,
    ),
  ];

  void onNavigationChanged(int index) {
    emit(index);
  }
}
