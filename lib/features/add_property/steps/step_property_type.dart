import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_app/core/widgets/layout/section_title.dart';
import 'package:real_estate_app/core/widgets/layout/selectable_icon_chip.dart';
import 'package:real_estate_app/features/add_property/provider/add_property_provider.dart';


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
          const SectionTitle(title: 'Property Type'),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              SelectableIconChip(
                icon: Icons.apartment,
                label: 'Apartment',
                isSelected: provider.propertyType == 'apartment',
                onTap: () => provider.setPropertyType('apartment'),
              ),
              SelectableIconChip(
                icon: Icons.house,
                label: 'House',
                isSelected: provider.propertyType == 'house',
                onTap: () => provider.setPropertyType('house'),
              ),
              SelectableIconChip(
                icon: Icons.villa,
                label: 'Villa',
                isSelected: provider.propertyType == 'villa',
                onTap: () => provider.setPropertyType('villa'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
