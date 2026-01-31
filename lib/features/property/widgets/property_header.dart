import 'package:flutter/material.dart';
import 'package:real_estate_app/features/property/widgets/image_gallery_hero.dart';

class PropertyHeader extends StatelessWidget {
  const PropertyHeader();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 320,
      pinned: true,
      backgroundColor: Colors.white,
      leading: _HeaderIcon(
        icon: Icons.chevron_left,
        onTap: () => Navigator.pop(context),
      ),
      actions: [
        _HeaderIcon(icon: Icons.favorite_border, onTap: () {}),
        _HeaderIcon(icon: Icons.share_outlined, onTap: () {}),
        const SizedBox(width: 12),
      ],
      flexibleSpace: const FlexibleSpaceBar(background: ImageGalleryHero()),
    );
  }
}


class _HeaderIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _HeaderIcon({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Material(
        color: Colors.black.withOpacity(0.45),
        shape: const CircleBorder(),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Icon(icon, color: Colors.white, size: 20),
          ),
        ),
      ),
    );
  }
}
