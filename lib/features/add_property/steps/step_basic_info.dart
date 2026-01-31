import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_app/core/theme/app_spacing.dart';
import 'package:real_estate_app/core/theme/app_text_styles.dart';
import 'package:real_estate_app/core/widgets/inputs/app_dropdown.dart';
import 'package:real_estate_app/core/widgets/inputs/app_number_field.dart';
import 'package:real_estate_app/core/widgets/inputs/app_segmented_selector.dart';
import 'package:real_estate_app/core/widgets/inputs/app_text_field.dart';
import 'package:real_estate_app/core/widgets/layout/form_section.dart';
import 'package:real_estate_app/features/add_property/provider/add_property_provider.dart';

class StepBasicInfo extends StatelessWidget {
  const StepBasicInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AddPropertyProvider>();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            FormSection(
              title: 'Information de la propiedad',
              child: Column(
                children: [
                  Text(
                    'Por favor, Proporciona la siguiente información de la propiedad que deseas agregar.',
                    style: AppTextStyles.body,
                  ),

                  const SizedBox(height: AppSpacing.md),
                  AppTextField(
                    label: 'Nombre',
                    controller: provider.propertyNameController,
                    hint: 'Ingrese el nombre de la propiedad',
                    hasError: provider.hasPropertyNameError,
                    errorText: 'El nombre es obligatorio',
                  ),

                  const SizedBox(height: AppSpacing.md),

                  AppSegmentedSelector<OfferType>(
                    label: 'Tipo de oferta',
                    value: provider.offerType,
                    onChanged: provider.setOfferType,
                    options: const {
                      OfferType.sale: 'Venta',
                      OfferType.rent: 'Alquiler',
                    },
                  ),

                  const SizedBox(height: AppSpacing.md),
                  AppTextField(
                    label: 'Descripción',
                    controller: provider.descriptionController,
                    maxLines: 2,
                    hint: 'Escribe una breve descripción de la propiedad',
                    hasError: provider.hasDescriptionError,
                    errorText: 'La descripción es obligatoria',
                  ),
                  const SizedBox(height: AppSpacing.md),
                  if (provider.offerType == OfferType.rent) ...[
                    const SizedBox(height: AppSpacing.md),
                    Row(
                      children: [
                        Expanded(child: _buildPrice(provider)),
                        const SizedBox(width: AppSpacing.md),
                        Expanded(child: _buildCurrency(provider)),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.md),
                    _buildPeriod(provider),
                  ] else ...[
                    const SizedBox(height: AppSpacing.md),
                    Row(
                      children: [
                        Expanded(child: _buildPrice(provider)),
                        const SizedBox(width: AppSpacing.md),
                        Expanded(child: _buildCurrency(provider)),
                      ],
                    ),
                  ],
                  const SizedBox(height: AppSpacing.md),
                  AppTextField(
                    label: 'Ubicación',
                    controller: provider.addressController,
                    hint: 'Ingrese la ubicación de la propiedad',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPrice(AddPropertyProvider provider) {
    return AppNumberField(
      label: 'Precio',
      controller: provider.priceController,
      hint: 'Ej: 120000.50',
      hasError: provider.hasPriceError,
      errorText: 'Ingrese un precio para la propiedad',
    );
  }

  Widget _buildCurrency(AddPropertyProvider provider) {
    return AppDropdown<Currency>(
      label: 'Moneda',
      value: provider.currency,
      onChanged: (v) => provider.setCurrency(v!),
      // hasError: provider.hasCurrencyError,
      // errorText: 'Seleccione una moneda',
      items: const [
        DropdownMenuItem(value: Currency.cop, child: Text('COP')),
        DropdownMenuItem(value: Currency.usd, child: Text('USD')),
      ],
    );
  }

  Widget _buildPeriod(AddPropertyProvider provider) {
    return AppDropdown<PeriodType>(
      label: 'Alquiler por',
      value: provider.period,
      onChanged: (v) => provider.setPeriod(v!),
      // hasError: provider.hasPeriodError,
      // errorText: 'Seleccione un período',
      items: const [
        DropdownMenuItem(value: PeriodType.month, child: Text('Mes')),
        DropdownMenuItem(value: PeriodType.week, child: Text('Semana')),
        DropdownMenuItem(value: PeriodType.day, child: Text('Día')),
        DropdownMenuItem(value: PeriodType.night, child: Text('Noche')),
        DropdownMenuItem(value: PeriodType.hour, child: Text('Hora')),
      ],
    );
  }
}
