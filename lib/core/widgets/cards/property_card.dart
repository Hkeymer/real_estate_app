import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PropertyCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final String statusLabel;
  final String location;
  final String listedAgo;
  final int bedrooms;
  final int bathrooms;
  final double area;
  final VoidCallback? onTap;
  final bool isFavorite;
  final VoidCallback? onFavoriteTap;

  const PropertyCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.statusLabel,
    required this.location,
    required this.listedAgo,
    required this.bedrooms,
    required this.bathrooms,
    required this.area,
    this.onTap,
    this.isFavorite = false,
    this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ImageSection(
              imageUrl: imageUrl,
              statusLabel: statusLabel,
              isFavorite: isFavorite,
              onFavoriteTap: onFavoriteTap,
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _TitlePriceRow(title: title, price: price),
                  const SizedBox(height: 6),
                  _LocationRow(listedAgo: listedAgo, location: location),
                  const SizedBox(height: 12),
                  _FeaturesRow(
                    bedrooms: bedrooms,
                    bathrooms: bathrooms,
                    area: area,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ImageSection extends StatelessWidget {
  final String imageUrl;
  final String statusLabel;
  final bool isFavorite;
  final VoidCallback? onFavoriteTap;

  const _ImageSection({
    required this.imageUrl,
    required this.statusLabel,
    required this.isFavorite,
    this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            height: 180,
            width: double.infinity,
            fit: BoxFit.cover,
            placeholder: (_, __) => Container(color: Colors.grey.shade200),
            errorWidget: (_, __, ___) => const Icon(Icons.image_not_supported),
          ),
        ),

        /// Badge
        Positioned(top: 12, left: 12, child: _StatusBadge(label: statusLabel)),

        /// Favorite
        Positioned(
          top: 12,
          right: 12,
          child: GestureDetector(
            onTap: onFavoriteTap,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final String label;

  const _StatusBadge({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _TitlePriceRow extends StatelessWidget {
  final String title;
  final String price;

  const _TitlePriceRow({required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          price,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}

class _LocationRow extends StatelessWidget {
  final String listedAgo;
  final String location;

  const _LocationRow({required this.listedAgo, required this.location});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.access_time, size: 14, color: Colors.grey),
        const SizedBox(width: 4),
        Text(
          listedAgo,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
        const SizedBox(width: 8),
        Text(
          location,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }
}

class _FeaturesRow extends StatelessWidget {
  final int bedrooms;
  final int bathrooms;
  final double area;

  const _FeaturesRow({
    required this.bedrooms,
    required this.bathrooms,
    required this.area,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _FeatureItem(icon: Icons.bed_outlined, label: '$bedrooms Bed'),
        _FeatureItem(icon: Icons.bathtub_outlined, label: '$bathrooms Bath'),
        _FeatureItem(
          icon: Icons.square_foot,
          label: '${area.toStringAsFixed(0)} sqft',
        ),
      ],
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _FeatureItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(fontSize: 13)),
      ],
    );
  }
}
