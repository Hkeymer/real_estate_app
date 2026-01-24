import 'package:flutter/material.dart';
import 'package:real_estate_app/core/theme/app_text_styles.dart';

class PropertyPrice extends StatelessWidget {
  final double price;

  const PropertyPrice({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Text('\$${price.toStringAsFixed(0)}', style: AppTextStyles.price);
  }
}
