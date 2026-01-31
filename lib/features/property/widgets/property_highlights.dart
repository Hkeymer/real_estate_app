import 'package:flutter/material.dart';
import 'package:real_estate_app/core/theme/app_colors.dart';
import 'package:real_estate_app/core/theme/app_spacing.dart';

class PropertyHighlights extends StatelessWidget {
  const PropertyHighlights({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.border,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            _HighlightItem(icon: Icons.bed_outlined, label: '3 Beds'),
            _HighlightItem(icon: Icons.bathtub_outlined, label: '2 Baths'),
            _HighlightItem(icon: Icons.square_foot_outlined, label: '120 m²'),
            // _HighlightItem(icon: Icons.home_outlined, label: 'Apartment'),
          ],
        ),
      ),
    );
  }
}

class _HighlightItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _HighlightItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 22, color: AppColors.primary),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
