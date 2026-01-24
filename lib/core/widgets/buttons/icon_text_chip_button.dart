import 'package:flutter/material.dart';
import 'package:real_estate_app/core/theme/app_colors.dart';
import 'package:real_estate_app/core/theme/app_radius.dart';
import 'package:real_estate_app/core/theme/app_spacing.dart';

class IconTextChipButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final bool isSelected;
  final bool selectable;

  const IconTextChipButton({
    super.key,
    required this.icon,
    required this.label,
    this.onTap,
    this.isSelected = false,
    this.selectable = true,
  });

  @override
  Widget build(BuildContext context) {
    final Color primaryAccent = AppColors.accent;

    final bool active = selectable && isSelected;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: selectable ? onTap : null,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        splashColor: selectable
            ? primaryAccent.withOpacity(0.12)
            : Colors.transparent,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.xxs / 2,
          ),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(
              color: active ? primaryAccent : AppColors.border,
              width: 1.2,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 16,
                color: active ? primaryAccent : AppColors.primary,
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  color: active ? primaryAccent : AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
