import 'package:flutter/material.dart';
import 'package:real_estate_app/core/theme/app_text_styles.dart';
import 'package:real_estate_app/core/theme/app_spacing.dart';
import 'package:real_estate_app/core/widgets/layout/section_title.dart';

class PropertyHeaderInfo extends StatelessWidget {
  const PropertyHeaderInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              SectionTitle(title: 'Modern Apartment'),
              Spacer(),
              Text('\$300,000', style: AppTextStyles.price),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: const [
              Icon(Icons.location_on_outlined, size: 16),
              SizedBox(width: 4),
              Text('123 Main Street, New York, NY 10001'),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: const [
              Icon(Icons.star, size: 16, color: Colors.amber),
              SizedBox(width: 4),
              Text('4.8'),
              SizedBox(width: 4),
              Text('(124 reviews)', style: TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}
