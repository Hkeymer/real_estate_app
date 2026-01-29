import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_app/core/widgets/inputs/app_text_field.dart';
import 'package:real_estate_app/core/widgets/layout/form_section.dart';
import 'package:real_estate_app/features/add_property/provider/add_property_provider.dart';

class StepLocation extends StatelessWidget {
  const StepLocation({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AddPropertyProvider>();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          FormSection(
            title: 'Location',
            child: Column(
              children: [
                AppTextField(
                  label: 'Address',
                  controller: provider.addressController,
                  hint: 'Street, number',
                ),
                const SizedBox(height: 16),
                AppTextField(
                  label: 'City',
                  controller: TextEditingController(text: provider.city ?? ''),
                ),
                const SizedBox(height: 16),
                AppTextField(
                  label: 'Country',
                  controller: TextEditingController(
                    text: provider.country ?? '',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
