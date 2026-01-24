import 'package:flutter/material.dart';
import 'package:real_estate_app/core/widgets/layout/section_title.dart';

class PropertyGallery extends StatelessWidget {
  const PropertyGallery({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(title: 'Gallery'),
        SizedBox(
          height: 80,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'https://picsum.photos/200/20$index',
                  width: 100,
                  fit: BoxFit.cover,
                ),
              );
            },
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemCount: 6,
          ),
        ),
      ],
    );
  }
}
