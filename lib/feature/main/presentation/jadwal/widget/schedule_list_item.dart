import 'package:dokterian_test/core/ui/widget/app_button.dart';
import 'package:dokterian_test/feature/main/domain/dto/doctor_schedule.dart';
import 'package:dokterian_test/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScheduleListItem extends StatelessWidget {
  final DoctorSchedule? data;

  const ScheduleListItem({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            offset: const Offset(2, 12),
            spreadRadius: 0,
            color: const Color(0xff5a75a70a).withOpacity(0.04),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                Assets.images.doctorNearby.path,
                width: 48,
                height: 48,
              ),
              const SizedBox(width: 8),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data?.nama ?? "-",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    data?.jenis ?? "-",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                  ),
                ],
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Divider(
              color: Color(0xFFF5F5F5),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    SvgPicture.asset(
                      Assets.icons.icDate,
                      width: 16,
                      height: 16,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        data?.tanggal ?? "-",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Wrap(
                  direction: Axis.horizontal,
                  spacing: 4,
                  children: [
                    SvgPicture.asset(
                      Assets.icons.icTime,
                      width: 16,
                      height: 16,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    Text(
                      data?.jadwal ?? "-",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          AppButton(
            title: "Detail",
            titleStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w500,
                ),
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
            radius: 360,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
