import 'package:flutter/material.dart';
import 'package:real_estate_app/core/widgets/cards/property_card_ctg.dart';
import 'package:real_estate_app/core/widgets/layout/section_title.dart';

class FeaturedProperties extends StatelessWidget {
  const FeaturedProperties({super.key});

  @override
  Widget build(BuildContext context) {
    final properties = [
      {
        'title': 'Modern Apartment',
        'location': 'Los Angeles',
        'price': 300000.0,
        'image': 'https://picsum.photos/300/200',
      },
      {
        'title': 'Luxury Villa',
        'location': 'Miami',
        'price': 850000.0,
        'image': 'https://picsum.photos/300/201',
      },
      {
        'title': 'Cozy Cottage',
        'location': 'San Francisco',
        'price': 220000.0,
        'image': 'https://picsum.photos/300/202',
      },
      {
        'title': 'Beachfront Villa',
        'location': 'Malibu',
        'price': 950000.0,
        'image': 'https://picsum.photos/300/203',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: 'Featured Properties'),
        const SizedBox(height: 16),
        SizedBox(
          height: 260,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: properties.length,
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              final property = properties[index];
              return PropertyCardCtg(
                title: property['title'] as String,
                location: property['location'] as String,
                price: property['price'] as double,
                imageUrl: property['image'] as String,
                onTap: () {
                  // navegación a detalle (paso 4)
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
