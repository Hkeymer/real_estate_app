import 'package:flutter/material.dart';
import 'package:real_estate_app/core/theme/app_colors.dart';
import 'package:real_estate_app/core/theme/app_spacing.dart';
import 'package:real_estate_app/core/widgets/layout/section_title.dart';

class PropertyLocationMap extends StatelessWidget {
  const PropertyLocationMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: Column(
        children: [
          SectionTitle(title: 'Location'),
          SizedBox(height: AppSpacing.sm),
          Container(
            // margin: const EdgeInsets.all(16),
            height: 180,
            decoration: BoxDecoration(
              color: AppColors.border,
              borderRadius: BorderRadius.circular(16),
            ),
            alignment: Alignment.center,
            child: const Text('Map Preview'),
          ),
        ],
      ),
    );
  }
}
