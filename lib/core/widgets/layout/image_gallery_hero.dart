import 'package:flutter/material.dart';
import 'package:real_estate_app/core/theme/app_colors.dart';

class ImageGalleryHero extends StatelessWidget {
  final String imageUrl;
  final int current;
  final int total;
  final VoidCallback? onTap;

  const ImageGalleryHero({
    super.key,
    required this.imageUrl,
    required this.current,
    required this.total,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: onTap,
              behavior: HitTestBehavior.opaque,
              child: Hero(
                tag: imageUrl,
                transitionOnUserGestures: true,
                child: Image.network(imageUrl, fit: BoxFit.cover),
              ),
            ),
          ),

          // GRADIENTE
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.6)],
                ),
              ),
            ),
          ),

          // CONTADOR
          Positioned(
            bottom: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.75),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '$current / $total',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
