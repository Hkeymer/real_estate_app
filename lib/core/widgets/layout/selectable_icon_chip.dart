import 'package:flutter/material.dart';
import 'package:real_estate_app/core/theme/app_colors.dart';
import 'package:real_estate_app/core/theme/app_radius.dart';

class SelectableIconChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback? onTap;
  final bool hasError;

  const SelectableIconChip({
    super.key,
    required this.icon,
    required this.label,
    this.isSelected = false,
    this.hasError = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      child: InkWell(
        borderRadius: BorderRadius.circular(AppRadius.sm),
        onTap: onTap,
        splashColor: AppColors.accent.withOpacity(0.12),
        highlightColor: AppColors.accent.withOpacity(0.12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          height: 48,
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.accent.withOpacity(0.12)
                : AppColors.surfaceVariant,
            borderRadius: BorderRadius.circular(AppRadius.sm),
            border: Border.all(
              color: hasError && !isSelected
                  ? Colors.red
                  : isSelected
                  ? Colors.blue
                  : Colors.grey,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 24,
                color: isSelected ? AppColors.accent : AppColors.textSecondary,
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w600,
                  color: isSelected ? AppColors.accent : AppColors.textPrimary,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
