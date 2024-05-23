import 'package:dokterian_test/core/ui/widget/app_search_field.dart';
import 'package:dokterian_test/feature/main/presentation/home/widget/grid_menu.dart';
import 'package:dokterian_test/feature/main/presentation/home/widget/highlight_doctor_banner.dart';
import 'package:dokterian_test/feature/main/presentation/home/widget/nearby_doctor_item.dart';
import 'package:dokterian_test/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello,",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onSurface),
                        ),
                        Text(
                          "Dimas Okva",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    ),
                    SvgPicture.asset(
                      Assets.icons.icAvatarUser,
                      width: 56,
                      height: 56,
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                const HighlightDoctorBanner(),
                const SizedBox(height: 20),
                const AppSearchField(
                  name: 'search',
                  hint: "Cari Dokter Spesialis",
                ),
                const SizedBox(height: 24),
                const GridMenu(),
                const SizedBox(height: 32),
                Text(
                  "Doctor Terdekat",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 16),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 1,
                  separatorBuilder: (ctx, index) => const SizedBox(height: 16),
                  itemBuilder: (ctx, index) => const NearbyDoctorItem(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
