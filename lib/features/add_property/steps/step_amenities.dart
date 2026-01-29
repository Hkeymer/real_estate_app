import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_app/core/widgets/layout/form_section.dart';
import 'package:real_estate_app/core/widgets/layout/selectable_icon_chip.dart';
import 'package:real_estate_app/features/add_property/provider/add_property_provider.dart';

class StepAmenities extends StatelessWidget {
  const StepAmenities({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AddPropertyProvider>();

    return FormSection(
      title: 'Select Amenities',
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: [
          SelectableIconChip(
            icon: Icons.pool,
            label: 'Swimming Pool',
            isSelected: provider.amenities.contains('pool'),
            onTap: () => provider.toggleAmenity('pool'),
          ),
          SelectableIconChip(
            icon: Icons.wifi,
            label: 'WiFi',
            isSelected: provider.amenities.contains('wifi'),
            onTap: () => provider.toggleAmenity('wifi'),
          ),
          SelectableIconChip(
            icon: Icons.local_parking,
            label: 'Parking',
            isSelected: provider.amenities.contains('parking'),
            onTap: () => provider.toggleAmenity('parking'),
          ),
          SelectableIconChip(
            icon: Icons.fireplace,
            label: 'Fireplace',
            isSelected: provider.amenities.contains('fireplace'),
            onTap: () => provider.toggleAmenity('fireplace'),
          ),
        ],
      ),
    );
  }
}
