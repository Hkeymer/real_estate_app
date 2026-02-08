import 'package:flutter/material.dart';
import 'package:real_estate_app/core/widgets/layout/app_header.dart';

class PropertyAppHeaderSliver extends StatelessWidget {
  const PropertyAppHeaderSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _AppHeaderDelegate(
        child: AppHeader(
          onShare: () => print('Compartir propiedad'),
          onFavorite: () => print('Favorito propiedad'),
        ),
      ),
    );
  }
}

class _AppHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _AppHeaderDelegate({required this.child});

  @override
  double get minExtent => kToolbarHeight;

  @override
  double get maxExtent => kToolbarHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return child;
  }

  @override
  bool shouldRebuild(covariant _AppHeaderDelegate oldDelegate) => false;
}
