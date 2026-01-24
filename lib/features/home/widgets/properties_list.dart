import 'package:flutter/material.dart';
import 'package:real_estate_app/core/widgets/cards/property_card_primary.dart';
import 'package:real_estate_app/core/widgets/layout/section_title.dart';

import 'package:real_estate_app/core/theme/app_spacing.dart';
import 'package:real_estate_app/features/property/ui/property_details_screen.dart';

class PropertiesList extends StatefulWidget {
  const PropertiesList({super.key});

  @override
  State<PropertiesList> createState() => _PropertiesListState();
}

class _PropertiesListState extends State<PropertiesList> {
  final Set<int> favoriteIndexes = {};

  late final List<PropertyMock> properties;

  @override
  void initState() {
    super.initState();

    properties = List.generate(6, (index) {
      return PropertyMock(
        image: 'https://picsum.photos/500/40${index + 1}',
        location: 'Medellín, El Poblado',
        price: index * 1000000 + 500000,
        publishedAt: 'Hace ${index + 1} días',
        bedrooms: 3,
        bathrooms: 2,
        area: 120,
        type: index.isEven ? 'Venta' : 'Alquiler',
        isFavorite: false,
        onTap: () {
          // Navigator.pushNamed(context, '/property');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => PropertyDetailScreen()),
          );
        },
        onFavoriteTap: () {},
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(title: 'Listado de propiedades'),
        const SizedBox(height: AppSpacing.md),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          // padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: properties.length,
          separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.sm),
          itemBuilder: (_, index) {
            final property = properties[index];
            final isFavorite = favoriteIndexes.contains(index);

            return PropertyCardPrimary(
              imageUrl: property.image,
              location: property.location,
              price: property.price,
              publishedAt: property.publishedAt,
              bedrooms: property.bedrooms,
              bathrooms: property.bathrooms,
              area: property.area,
              type: property.type,
              isFavorite: isFavorite,
              onTap: () {
                property.onTap();
              },
              onFavoriteTap: () {
                setState(() {
                  isFavorite
                      ? favoriteIndexes.remove(index)
                      : favoriteIndexes.add(index);
                });
              },
            );
          },
        ),
      ],
    );
  }
}
