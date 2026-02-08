import 'package:flutter/material.dart';
import 'package:real_estate_app/core/theme/app_text_styles.dart';
import 'package:real_estate_app/core/widgets/layout/section_title.dart';

class FormSection extends StatelessWidget {
  final String title;
  final Widget child;

  const FormSection({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.title),
        const SizedBox(height: 12),
        child,
      ],
    );
  }
}
