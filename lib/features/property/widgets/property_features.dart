import 'package:flutter/material.dart';
import 'package:real_estate_app/core/theme/app_spacing.dart';
import 'package:real_estate_app/core/widgets/layout/section_title.dart';
import 'package:real_estate_app/core/widgets/layout/selectable_icon_chip.dart';

class PropertyFeatures extends StatelessWidget {
  final List<FeatureItem> features;
  final List<String> selected;
  final ValueChanged<String> onToggle;

  const PropertyFeatures({
    super.key,
    required this.features,
    required this.selected,
    required this.onToggle,
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
              return SelectableIconChip(
                icon: feature.icon,
                label: feature.label,
                isSelected: selected.contains(feature.label),
                onTap: () => onToggle(feature.label),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class FeatureItem {
  final String label;
  final IconData icon;

  FeatureItem({required this.label, required this.icon});
}
