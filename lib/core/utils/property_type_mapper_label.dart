import 'package:real_estate_app/core/enums/property_type.dart';

String propertyTypeMapperLabel(PropertyType type) {
  switch (type) {
    case PropertyType.apartment:
      return 'Apartamento';
    case PropertyType.house:
      return 'Casa';
    case PropertyType.villa:
      return 'Villa';
    case PropertyType.farm:
      return 'Finca';
    case PropertyType.commercial:
      return 'Comercial';
    case PropertyType.office:
      return 'Oficina';
    case PropertyType.warehouse:
      return 'Almacén';
    case PropertyType.hotel:
      return 'Hotel';
    case PropertyType.land:
      return 'Terreno';
    case PropertyType.building:
      return 'Edificio';
  }
}
