import 'package:flutter/material.dart';

class ScheduleMenuData {
  final int index;
  final String title;

  ScheduleMenuData({required this.index, required this.title});
}

final List<ScheduleMenuData> _menus = [
  ScheduleMenuData(index: 0, title: 'Jadwal dibatalkan'),
  ScheduleMenuData(index: 1, title: 'Jadwal Dokter'),
  ScheduleMenuData(index: 2, title: 'Semua Jadwal'),
];

class ScheduleMenu extends StatefulWidget {
  final int activeIndex;
  final ValueChanged<int> onMenuChanged;

  const ScheduleMenu({
    super.key,
    required this.activeIndex,
    required this.onMenuChanged,
  });

  @override
  State<ScheduleMenu> createState() => _ScheduleMenuState();
}

class _ScheduleMenuState extends State<ScheduleMenu> {
  final scrollController = ScrollController(initialScrollOffset: 100);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Wrap(
        direction: Axis.horizontal,
        spacing: 12,
        children: _menus
            .map(
              (menu) => Material(
                borderRadius: BorderRadius.circular(360),
                color: widget.activeIndex == menu.index
                    ? Theme.of(context).colorScheme.secondary.withOpacity(0.1)
                    : Theme.of(context).colorScheme.surface,
                child: InkWell(
                  borderRadius: BorderRadius.circular(360),
                  onTap: () {
                    widget.onMenuChanged(menu.index);

                    scrollController.animateTo(
                      menu.index * 100,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: AnimatedPadding(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    child: Text(
                      menu.title,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: widget.activeIndex == menu.index
                                ? Theme.of(context).colorScheme.secondary
                                : Theme.of(context).colorScheme.onSurface,
                            fontSize:
                                widget.activeIndex == menu.index ? 16 : 12,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
