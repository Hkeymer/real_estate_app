import 'package:flutter/material.dart';
import 'package:real_estate_app/core/theme/app_colors.dart';

class AppSearchInput extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool hasError;
  final String? errorText;
  final ValueChanged<String>? onChanged;

  const AppSearchInput({
    super.key,
    required this.hintText,
    required this.controller,
    this.hasError = false,
    this.errorText,
    this.onChanged,
  });

  OutlineInputBorder _border(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: color, width: 1.2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: const Icon(Icons.location_on_outlined),
        suffixIcon: Container(
          margin: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.shade200,
          ),
          child: const Icon(Icons.search),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        hintStyle: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary),

        // 🔑 BORDES CORRECTOS
        enabledBorder: _border(AppColors.border),
        focusedBorder: _border(AppColors.accent),
        errorBorder: _border(Colors.red),
        focusedErrorBorder: _border(Colors.redAccent),

        errorText: hasError ? errorText : null,
      ),
    );
  }
}
