import 'package:flutter/material.dart';
import 'package:real_estate_app/core/constants/amenities_catalog.dart';
import 'package:real_estate_app/core/theme/app_spacing.dart';
import 'package:real_estate_app/core/widgets/layout/section_title.dart';
import 'package:real_estate_app/core/widgets/layout/icon_chip.dart';

class PropertyFeatures extends StatelessWidget {
  final List<AmenityItem> features;

  const PropertyFeatures({
    super.key,
    required this.features,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(title: 'Features'),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: features.map((feature) {
              return IconChip(
                icon: feature.icon,
                label: feature.label,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

