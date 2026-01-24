import 'package:flutter/material.dart';

import 'package:real_estate_app/core/theme/app_colors.dart';
import 'package:real_estate_app/core/theme/app_spacing.dart';
import 'package:real_estate_app/core/theme/app_radius.dart';
import 'package:real_estate_app/core/widgets/layout/section_title.dart';

class PropertyDetailsTable extends StatelessWidget {
  const PropertyDetailsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: Column(
        children: [
          SectionTitle(title: 'Details'),
          SizedBox(height: AppSpacing.sm),
          Container(
            // margin: const EdgeInsets.all(AppSpacing.md),
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.border,
              borderRadius: BorderRadius.circular(AppRadius.lg),
            ),
            child: Column(
              children: [
                _DetailRow(label: 'On Market', value: '30 days'),
                _Divider(),
                _DetailRow(label: 'Country', value: 'Afghanistan'),
                _Divider(),
                _DetailRow(label: 'Build Year', value: '1997'),
                _Divider(),
                _DetailRow(label: 'Lot Size', value: '3,400 sqft'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
      child: Divider(height: 1, color: Colors.grey.shade200),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: Theme.of(context).textTheme.bodyMedium),
          Text(
            value,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
