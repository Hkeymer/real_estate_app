import 'package:flutter/material.dart';
import 'package:real_estate_app/core/theme/app_colors.dart';
import 'package:real_estate_app/core/theme/app_radius.dart';

class IconChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final bool hasError;
  final VoidCallback? onTap;

  const IconChip({
    super.key,
    required this.icon,
    required this.label,
    this.isSelected = false,
    this.hasError = false,
    this.onTap,
  });

  bool get _isInteractive => onTap != null;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      child: InkWell(
        onTap: _isInteractive ? onTap : null,
        borderRadius: BorderRadius.circular(AppRadius.sm),
        splashColor: _isInteractive
            ? AppColors.accent.withOpacity(0.12)
            : Colors.transparent,
        highlightColor: Colors.transparent,
        child: Container(
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: _backgroundColor,
            borderRadius: BorderRadius.circular(AppRadius.sm),
            border: Border.all(color: _borderColor),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 22, color: _iconColor),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  label,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: _textColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 🎨 Estilos derivados del estado

  Color get _backgroundColor {
    if (isSelected) {
      return AppColors.accent.withOpacity(0.12);
    }
    return AppColors.surfaceVariant;
  }

  Color get _borderColor {
    if (hasError && !isSelected) return Colors.red;
    if (isSelected) return AppColors.accent;
    return Colors.grey.shade300;
  }

  Color get _iconColor {
    if (isSelected) return AppColors.accent;
    return AppColors.textSecondary;
  }

  Color get _textColor {
    if (isSelected) return AppColors.accent;
    return AppColors.textPrimary;
  }
}
