import 'package:flutter/material.dart';
import 'package:real_estate_app/core/enums/amenity.dart';

class AmenityItem {
  final Amenity value;
  final String label;
  final IconData icon;

  const AmenityItem({
    required this.value,
    required this.label,
    required this.icon,
  });
}

const amenitiesCatalog = [
  AmenityItem(value: Amenity.pool, label: 'Piscina', icon: Icons.pool),
  AmenityItem(value: Amenity.wifi, label: 'WiFi', icon: Icons.wifi),
  AmenityItem(
    value: Amenity.parking,
    label: 'Parqueadero',
    icon: Icons.local_parking,
  ),
  AmenityItem(
    value: Amenity.fireplace,
    label: 'Chimenea',
    icon: Icons.fireplace,
  ),
  AmenityItem(
    value: Amenity.gym,
    label: 'Gimnasio',
    icon: Icons.fitness_center,
  ),
  AmenityItem(
    value: Amenity.airConditioning,
    label: 'Aire Acondicionado',
    icon: Icons.ac_unit,
  ),
  AmenityItem(value: Amenity.elevator, label: 'Ascensor', icon: Icons.elevator),
  AmenityItem(
    value: Amenity.security,
    label: 'Seguridad',
    icon: Icons.security,
  ),
  // AmenityItem(value: Amenity.bbq, label: 'BBQ', icon: Icons.outdoor_grill),
  // AmenityItem(value: Amenity.garden, label: 'Jardín', icon: Icons.grass),
];
