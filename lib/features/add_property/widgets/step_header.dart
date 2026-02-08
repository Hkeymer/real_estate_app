import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_app/core/theme/app_text_styles.dart';
import 'package:real_estate_app/features/add_property/provider/add_property_provider.dart';

import 'package:real_estate_app/core/theme/app_colors.dart';
import 'package:real_estate_app/core/theme/app_radius.dart';

class StepHeader extends StatelessWidget {
  final VoidCallback? onBack;

  const StepHeader({super.key, this.onBack});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AddPropertyProvider>();

    final int current = provider.currentStep + 1;
    final int total = AddPropertyProvider.totalSteps;
    final double progress = current / total;

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// TOP ROW
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(AppRadius.sm),
                  onTap: onBack ?? provider.previousStep,
                  child: const Padding(
                    padding: EdgeInsets.all(6),
                    child: Icon(Icons.chevron_left, size: 28),
                  ),
                ),

                /// TITLE
                Text('Añadir propiedad', style: AppTextStyles.title),
              ],
            ),
            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Detalle de la propiedad', style: AppTextStyles.body),

                /// PROGRESS INDICATOR
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),

                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(AppRadius.md),
                  ),
                  child: Text(
                    '0$current / 0$total',
                    style: Theme.of(
                      context,
                    ).textTheme.labelMedium?.copyWith(color: AppColors.surface),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            /// PROGRESS BAR
            ClipRRect(
              borderRadius: BorderRadius.circular(AppRadius.sm),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 8,
                backgroundColor: AppColors.surfaceVariant,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
