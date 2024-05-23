import 'package:dokterian_test/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GridMenuItem {
  final String title;
  final String slug;
  final String icon;

  GridMenuItem({
    required this.title,
    required this.slug,
    required this.icon,
  });
}

final List<GridMenuItem> _gridItems = [
  GridMenuItem(
    title: "Dokter",
    slug: "dokter",
    icon: Assets.icons.icDokter,
  ),
  GridMenuItem(
    title: "Obat & Resep",
    slug: "obat_resep",
    icon: Assets.icons.icObat,
  ),
  GridMenuItem(
    title: "Rumah Sakit",
    slug: "rumah_sakit",
    icon: Assets.icons.icRumahSakit,
  ),
];

class GridMenu extends StatelessWidget {
  const GridMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Wrap(
        spacing: 12,
        direction: Axis.horizontal,
        children: _gridItems
            .map(
              (item) => Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      item.icon,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.title,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
