import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_app/core/constants/amenities_catalog.dart';
import 'package:real_estate_app/core/widgets/layout/form_section.dart';
import 'package:real_estate_app/core/widgets/layout/icon_chip.dart';
import 'package:real_estate_app/features/add_property/provider/add_property_provider.dart';

class StepAmenities extends StatelessWidget {
  const StepAmenities({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AddPropertyProvider>();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: FormSection(
        title: 'Select Amenities',
        child: Wrap(
          spacing: 10,
          runSpacing: 10,
          children: amenitiesCatalog.map((amenity) {
            return IconChip(
              icon: amenity.icon,
              label: amenity.label,
              isSelected: provider.amenities.contains(amenity.value),
              onTap: () => provider.toggleAmenity(amenity.value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
