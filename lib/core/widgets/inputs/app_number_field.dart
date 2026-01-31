import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:real_estate_app/core/widgets/inputs/app_text_field.dart';

class AppNumberField extends StatelessWidget {
  final String label;
  final String? hint;
  final bool isDecimal;
  final TextEditingController controller;
  final bool hasError;
  final String? errorText;

  const AppNumberField({
    super.key,
    required this.label,
    required this.controller,
    this.isDecimal = false,
    this.hint,
    this.hasError = false,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      label: label,
      hint: hint,
      controller: controller,
      hasError: hasError,
      errorText: errorText,
      keyboardType: isDecimal
          ? TextInputType.numberWithOptions(decimal: true)
          : TextInputType.number,
      inputFormatters: [
        isDecimal
            ? FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
            : FilteringTextInputFormatter.digitsOnly,
      ],
    );
  }
}
