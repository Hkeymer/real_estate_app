import 'package:flutter/material.dart';
import 'package:real_estate_app/core/theme/app_text_styles.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final VoidCallback? onAction;

  const SectionTitle({super.key, required this.title, this.onAction});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextStyles.title),
        if (onAction != null)
          TextButton(onPressed: onAction, child: const Text('View More')),
      ],
    );
  }
}
