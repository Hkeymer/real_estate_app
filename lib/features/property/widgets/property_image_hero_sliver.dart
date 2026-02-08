import 'package:flutter/material.dart';
import 'package:real_estate_app/core/widgets/layout/image_gallery_hero.dart';

class PropertyImageHeroSliver extends StatelessWidget {
  const PropertyImageHeroSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: ImageGalleryHero(
        imageUrl: 'https://picsum.photos/800/600',
        current: 4,
        total: 137,
      ),
    );
  }
}
