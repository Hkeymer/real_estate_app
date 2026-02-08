import 'package:flutter/material.dart';
import 'package:real_estate_app/core/widgets/layout/property_price.dart';
import 'package:real_estate_app/core/theme/app_text_styles.dart';

class PropertyCardCtg extends StatelessWidget {
  final String title;
  final String location;
  final double price;
  final String imageUrl;
  final VoidCallback onTap;

  const PropertyCardCtg({
    super.key,
    required this.title,
    required this.location,
    required this.price,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 220,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: Image.network(
                imageUrl,
                height: 140,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.title, maxLines: 1),
                  const SizedBox(height: 4),
                  Text(location, style: AppTextStyles.body),
                  const SizedBox(height: 8),
                  PropertyPrice(price: price),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
