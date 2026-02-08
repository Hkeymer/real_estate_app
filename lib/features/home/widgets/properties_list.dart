import 'package:flutter/material.dart';
import 'package:real_estate_app/core/widgets/cards/property_card.dart';
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
          itemCount: properties.length,
          separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.sm),
          itemBuilder: (_, index) {
            final property = properties[index];

            final isFavorite = favoriteIndexes.contains(index);

            return TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: 1),
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOut,
              builder: (context, value, child) {
                return Opacity(
                  opacity: value,
                  child: Transform.translate(
                    offset: Offset(0, 20 * (1 - value)),
                    child: child,
                  ),
                );
              },
              child: PropertyCard(
                imageUrl: property.image,
                title: 'Se vende Propiedad en ${property.location}',
                price: '\$${property.price.toStringAsFixed(0)}',
                statusLabel: 'En ${property.type}',
                location: property.location,
                listedAgo: property.publishedAt,
                bedrooms: property.bedrooms,
                bathrooms: property.bathrooms,
                area: property.area.toDouble(),
                isFavorite: false,
                onFavoriteTap: () {
                  setState(() {
                    isFavorite
                        ? favoriteIndexes.remove(index)
                        : favoriteIndexes.add(index);
                  });
                },
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const PropertyDetailScreen(),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
