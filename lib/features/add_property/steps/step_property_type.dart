import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_app/core/widgets/layout/section_title.dart';
import 'package:real_estate_app/core/widgets/layout/selectable_icon_chip.dart';
import 'package:real_estate_app/features/add_property/provider/add_property_provider.dart';
import 'package:real_estate_app/core/utils/property_type_utils.dart';



class StepPropertyType extends StatelessWidget {
  const StepPropertyType({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AddPropertyProvider>();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(title: '¿Cuál es tu tipo de propiedad?'),
          const SizedBox(height: 16),

          if (provider.hasPropertyTypeError)
            const Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text(
                'Debes seleccionar un tipo de propiedad',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          const SizedBox(height: 8),

          Expanded(
            child: ListView.separated(
              itemCount: _propertyTypes.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final item = _propertyTypes[index];

                return SelectableIconChip(
                  icon: item.icon,
                  label: item.label,
                  hasError: provider.hasPropertyTypeError,
                  isSelected: provider.propertyType == item.value,
                  onTap: () => provider.setPropertyType(item.value),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

final List<_PropertyTypeItem> _propertyTypes = [
  _PropertyTypeItem(
    label: 'Apartamento',
    value: PropertyType.apartment,
    icon: propertyTypeIcon(PropertyType.apartment),
  ),
  _PropertyTypeItem(
    label: 'Casa',
    value: PropertyType.house,
    icon: propertyTypeIcon(PropertyType.house),
  ),
  _PropertyTypeItem(
    label: 'Villa',
    value: PropertyType.villa,
    icon: propertyTypeIcon(PropertyType.villa),
  ),
  _PropertyTypeItem(
    label: 'Finca',
    value: PropertyType.farm,
    icon: propertyTypeIcon(PropertyType.farm),
  ),
  _PropertyTypeItem(
    label: 'Local Comercial',
    value: PropertyType.commercial,
    icon: propertyTypeIcon(PropertyType.commercial),
  ),
  _PropertyTypeItem(
    label: 'Oficina',
    value: PropertyType.office,
    icon: propertyTypeIcon(PropertyType.office),
  ),
  _PropertyTypeItem(
    label: 'Bodega',
    value: PropertyType.warehouse,
    icon: propertyTypeIcon(PropertyType.warehouse),
  ),
  _PropertyTypeItem(
    label: 'Hotel',
    value: PropertyType.hotel,
    icon: propertyTypeIcon(PropertyType.hotel),
  ),
  _PropertyTypeItem(
    label: 'Terreno',
    value: PropertyType.land,
    icon: propertyTypeIcon(PropertyType.land),
  ),
  _PropertyTypeItem(
    label: 'Edificio',
    value: PropertyType.building,
    icon: propertyTypeIcon(PropertyType.building),
  ),
];

class _PropertyTypeItem {
  final String label;
  final PropertyType value;
  final IconData icon;

  const _PropertyTypeItem({
    required this.label,
    required this.value,
    required this.icon,
  });
}
