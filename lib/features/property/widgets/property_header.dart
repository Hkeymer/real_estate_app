import 'package:flutter/material.dart';
import 'package:real_estate_app/core/widgets/layout/app_header.dart';
import 'package:real_estate_app/core/widgets/layout/image_gallery_hero.dart';

class PropertyHeader extends StatelessWidget {
  const PropertyHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      toolbarHeight: kToolbarHeight,
      flexibleSpace: const SizedBox.shrink(),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(260),
        child: Column(
          children: const [
            ImageGalleryHero(
              imageUrl: 'https://picsum.photos/800/600',
              current: 4,
              total: 137,
            ),
          ],
        ),
      ),
      titleSpacing: 0,
      title: AppHeader(
        onShare: () => print("Compartir propiedad"),
        onFavorite: () => print("Favorito propiedad"),
      ),
    );
  }
}
