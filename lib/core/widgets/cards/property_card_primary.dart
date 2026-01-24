import 'package:flutter/material.dart';
import 'package:real_estate_app/core/widgets/layout/property_price.dart';

class PropertyMock {
  final String image;
  final String location;
  final double price;
  final String publishedAt;
  final int bedrooms;
  final int bathrooms;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;
  final double area;
  final String type; // venta / alquiler
  final VoidCallback onTap;

  PropertyMock({
    required this.image,
    required this.location,
    required this.price,
    required this.publishedAt,
    required this.bedrooms,
    required this.bathrooms,
    required this.isFavorite,
    required this.onFavoriteTap,
    required this.area,
    required this.type,
    required this.onTap,
  });
}

class PropertyCardPrimary extends StatelessWidget {
  final String imageUrl;
  final String location;
  final double price;
  final String publishedAt;
  final int bedrooms;
  final int bathrooms;
  final double area;
  final String type; // Venta / Alquiler
  final bool isFavorite;
  final VoidCallback onFavoriteTap;
  final VoidCallback onTap;

  const PropertyCardPrimary({
    super.key,
    required this.imageUrl,
    required this.location,
    required this.price,
    required this.publishedAt,
    required this.bedrooms,
    required this.bathrooms,
    required this.area,
    required this.isFavorite,
    required this.onFavoriteTap,
    required this.type,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
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
            _PropertyImage(
              imageUrl: imageUrl,
              type: type,
              isFavorite: false,
              onFavoriteTap: () {},
            ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // _Price(price: price),
                  PropertyPrice(price: price),
                  const SizedBox(height: 6),
                  _Location(location: location),
                  // const SizedBox(height: 8),
                  // _PublishedAt(date: publishedAt),
                  const SizedBox(height: 12),
                  _PropertySpecs(
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

class _PropertyImage extends StatelessWidget {
  final String imageUrl;
  final String type;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;

  const _PropertyImage({
    required this.imageUrl,
    required this.type,
    required this.isFavorite,
    required this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(imageUrl, fit: BoxFit.cover),
          ),

          // Badge Venta / Alquiler
          Positioned(top: 12, left: 12, child: _PropertyBadge(label: type)),

          // Botón favorito
          Positioned(
            top: 12,
            right: 12,
            child: _FavoriteButton(
              isFavorite: isFavorite,
              onTap: onFavoriteTap,
            ),
          ),
        ],
      ),
    );
  }
}

class _FavoriteButton extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback onTap;

  const _FavoriteButton({required this.isFavorite, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withOpacity(0.45),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.redAccent : Colors.white,
            size: 20,
          ),
        ),
      ),
    );
  }
}

class _PropertyBadge extends StatelessWidget {
  final String label;

  const _PropertyBadge({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.75),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label.toUpperCase(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

class _Price extends StatelessWidget {
  final String price;

  const _Price({required this.price});

  @override
  Widget build(BuildContext context) {
    return Text(
      price,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}

class _Location extends StatelessWidget {
  final String location;

  const _Location({required this.location});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.location_on_outlined, size: 16),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            location,
            style: TextStyle(color: Colors.grey.shade700, fontSize: 13),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _PublishedAt extends StatelessWidget {
  final String date;

  const _PublishedAt({required this.date});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.schedule, size: 14, color: Colors.grey),
        const SizedBox(width: 4),
        Text(date, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}

class _PropertySpecs extends StatelessWidget {
  final int bedrooms;
  final int bathrooms;
  final double area;

  const _PropertySpecs({
    required this.bedrooms,
    required this.bathrooms,
    required this.area,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _SpecItem(icon: Icons.bed_outlined, value: '$bedrooms'),
        _SpecItem(icon: Icons.bathtub_outlined, value: '$bathrooms'),
        _SpecItem(icon: Icons.square_foot_outlined, value: '${area}m²'),
      ],
    );
  }
}

class _SpecItem extends StatelessWidget {
  final IconData icon;
  final String value;

  const _SpecItem({required this.icon, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.grey.shade700),
        const SizedBox(width: 4),
        Text(value, style: const TextStyle(fontSize: 13)),
      ],
    );
  }
}
