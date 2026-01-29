import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(AppRadius.sm),
                  onTap: onBack ?? provider.previousStep,
                  child: const Padding(
                    padding: EdgeInsets.all(6),
                    child: Icon(Icons.arrow_back, size: 22),
                  ),
                ),
                const Spacer(),
                Text(
                  '$current / $total',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            /// TITLE
            Text(
              'Add Property',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 12),

            /// PROGRESS BAR
            ClipRRect(
              borderRadius: BorderRadius.circular(AppRadius.sm),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 6,
                backgroundColor: AppColors.surfaceVariant,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.accent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
