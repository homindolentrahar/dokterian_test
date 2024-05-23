import 'package:dokterian_test/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class HighlightDoctorBanner extends StatelessWidget {
  const HighlightDoctorBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(360),
                child: Image.asset(
                  Assets.images.doctorHigh.path,
                  width: 48,
                  height: 48,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dr. Imran Syahir",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Dokter Umum",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                          ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              SvgPicture.asset(Assets.icons.icNext),
            ],
          ),
          const SizedBox(height: 16),
          Divider(
            color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.15),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Wrap(
                  direction: Axis.horizontal,
                  spacing: 4,
                  children: [
                    SvgPicture.asset(
                      Assets.icons.icDate,
                      width: 16,
                      height: 16,
                    ),
                    Text(
                      DateFormat("EEEE, dd MMMM").format(DateTime.now()),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
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
                    ),
                    Text(
                      "${DateFormat("HH:mm").format(DateTime.now())} - ${DateFormat("HH:mm").format(DateTime.now().add(const Duration(hours: 1)))}",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
