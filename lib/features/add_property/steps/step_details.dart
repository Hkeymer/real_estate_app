import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_app/core/widgets/inputs/app_text_field.dart';
import 'package:real_estate_app/core/widgets/layout/form_section.dart';
import 'package:real_estate_app/features/add_property/provider/add_property_provider.dart';

class StepDetails extends StatelessWidget {
  const StepDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AddPropertyProvider>();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          FormSection(
            title: 'Property Details',
            child: Column(
              children: [
                AppTextField(
                  label: 'Bedrooms',
                  controller: TextEditingController(
                    text: provider.bedrooms?.toString() ?? '',
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                AppTextField(
                  label: 'Bathrooms',
                  controller: TextEditingController(
                    text: provider.bathrooms?.toString() ?? '',
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                AppTextField(
                  label: 'Garage',
                  controller: TextEditingController(
                    text: provider.garage?.toString() ?? '',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
