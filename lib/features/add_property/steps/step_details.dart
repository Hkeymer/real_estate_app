import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_app/core/theme/app_spacing.dart';
import 'package:real_estate_app/core/theme/app_text_styles.dart';
import 'package:real_estate_app/core/widgets/inputs/app_dropdown.dart';
import 'package:real_estate_app/core/widgets/inputs/app_number_field.dart';
import 'package:real_estate_app/core/widgets/inputs/app_switch_tile.dart';
import 'package:real_estate_app/core/widgets/layout/form_section.dart';
import 'package:real_estate_app/features/add_property/provider/add_property_provider.dart';
import 'package:real_estate_app/shared/models/property/property_details_model.dart';

class StepDetails extends StatelessWidget {
  const StepDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AddPropertyProvider>();
    final type = provider.propertyType?.name ?? '';

    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            /// 🛏 ESPACIOS
            FormSection(
              title: 'Has elegido $type, ¡ahora cuéntanos más sobre él! ',
              child: Column(
                children: [
                  Text(
                    'Añade los datos de tu $type para ayudarnos a encontrar la mejor opción para ti.',
                    style: AppTextStyles.body,
                  ),

                  const SizedBox(height: AppSpacing.md),
                  Row(
                    children: [
                      Expanded(
                        child: AppNumberField(
                          label: 'Área construida',
                          controller: provider.areaController,
                          hint: '0 m2',
                        ),
                      ),

                      const SizedBox(width: 12),
                      Expanded(
                        child: AppNumberField(
                          label: 'Área total',
                          controller: provider.lotAreaController,
                          hint: '0 m2',
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: AppSpacing.md),
                  Row(
                    children: [
                      Expanded(
                        child: AppNumberField(
                          label: 'Año de construcción',
                          controller: provider.yearBuiltController,
                          hint: '2020',
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: AppDropdown<PropertyCondition>(
                          label: 'Estado',
                          value: provider.condition,
                          items: PropertyCondition.values.map((condition) {
                            return DropdownMenuItem(
                              value: condition,
                              child: Text(_conditionLabel(condition)),
                            );
                          }).toList(),
                          onChanged: (value) {
                            if (value != null) {
                              provider.setCondition(value);
                            }
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: AppSpacing.md),
                  Row(
                    children: [
                      Expanded(
                        child: AppNumberField(
                          label: 'Baños',
                          controller: provider.bathroomsController,
                          hint: '1',
                          hasError: provider.hasBathroomsError,
                          errorText: provider.hasBathroomsError
                              ? 'Este campo es requerido'
                              : null,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: AppNumberField(
                          label: 'Habitaciones',
                          controller: provider.bedroomsController,
                          hint: '3',
                          hasError: provider.hasBedroomsError,
                          errorText: provider.hasBedroomsError
                              ? 'por favor ingrese el numero de habitaciones'
                              : null,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: AppSpacing.md),
                  Row(
                    children: [
                      Expanded(
                        child: AppNumberField(
                          label: 'Pisos',
                          controller: provider.floorsController,
                          hint: '2',
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: AppNumberField(
                          label: 'Tamaño del garaje',
                          controller: provider.garageSizeController,
                          hint: '0',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppSpacing.md),

            /// 🏖 CARACTERÍSTICAS ESPECIALES
            FormSection(
              title: 'Características Especiales',
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: AppSwitchTile(
                          label: 'Mascotas',
                          value: provider.petsAllowed,
                          onChanged: provider.setPetsAllowed,
                          icon: Icons.pets,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: AppSwitchTile(
                          label: 'Balcón',
                          value: provider.hasBalcony,
                          onChanged: provider.setHasBalcony,
                          icon: Icons.balcony,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  AppSwitchTile(
                    label: 'Terraza',
                    value: provider.hasTerrace,
                    onChanged: provider.setHasTerrace,
                    icon: Icons.deck,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  AppSwitchTile(
                    label: 'Amoblado',
                    value: provider.furnished,
                    onChanged: provider.setFurnished,
                    icon: Icons.chair_alt,
                  ),
                  // const SizedBox(height: AppSpacing.md),
                  // AppSwitchTile(
                  //   label: 'Jardín',
                  //   value: provider.hasGarden,
                  //   onChanged: provider.setHasGarden,
                  //   icon: Icons.grass,
                  // ),
                  // const SizedBox(height: AppSpacing.md),
                  // AppSwitchTile(
                  //   label: 'BBQ',
                  //   value: provider.hasBarbecue,
                  //   onChanged: provider.setHasBarbecue,
                  //   icon: Icons.outdoor_grill,
                  // ),
                ],
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  String _conditionLabel(PropertyCondition condition) {
    switch (condition) {
      case PropertyCondition.newProperty:
        return 'Nuevo';
      case PropertyCondition.used:
        return 'Usado';
      case PropertyCondition.renovated:
        return 'Remodelado';
    }
  }
}
