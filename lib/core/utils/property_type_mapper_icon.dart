import 'package:flutter/material.dart';
import 'package:real_estate_app/core/enums/property_type.dart';

IconData propertyTypeMapperIcon(PropertyType type) {
  switch (type) {
    case PropertyType.apartment:
      return Icons.apartment;
    case PropertyType.house:
      return Icons.house;
    case PropertyType.villa:
      return Icons.villa;
    case PropertyType.farm:
      return Icons.agriculture;
    case PropertyType.commercial:
      return Icons.store;
    case PropertyType.office:
      return Icons.business;
    case PropertyType.warehouse:
      return Icons.warehouse;
    case PropertyType.hotel:
      return Icons.hotel;
    case PropertyType.land:
      return Icons.terrain;
    case PropertyType.building:
      return Icons.location_city;
  }
}
