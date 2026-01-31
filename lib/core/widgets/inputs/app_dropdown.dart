import 'package:flutter/material.dart';
import 'package:real_estate_app/core/theme/app_colors.dart';
import 'package:real_estate_app/core/widgets/layout/section_subtitle.dart';

class AppDropdown<T> extends StatelessWidget {
  final String label;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?> onChanged;
  final bool hasError;
  final String? errorText;

  const AppDropdown({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
    this.hasError = false,
    this.errorText,
  });

  OutlineInputBorder _border(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: color, width: 1.2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionSubtitle(title: label),
        const SizedBox(height: 6),
        DropdownButtonFormField<T>(
          value: value,
          items: items,
          onChanged: onChanged,
          isExpanded: true,
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor: AppColors.surfaceVariant,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 14,
            ),

            enabledBorder: _border(AppColors.border),
            focusedBorder: _border(AppColors.accent),
            errorBorder: _border(Colors.red),
            focusedErrorBorder: _border(Colors.redAccent),

            errorText: hasError ? errorText : null,
            
          ),
        ),
      ],
    );
  }
}
