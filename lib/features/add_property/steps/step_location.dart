import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_app/core/theme/app_spacing.dart';
import 'package:real_estate_app/core/theme/app_text_styles.dart';
import 'package:real_estate_app/core/widgets/inputs/app_search_input.dart';
import 'package:real_estate_app/core/widgets/inputs/app_text_field.dart';
import 'package:real_estate_app/core/widgets/layout/form_section.dart';
import 'package:real_estate_app/features/add_property/provider/add_property_provider.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:real_estate_app/shared/services/openstreetmap_service.dart';

class StepLocation extends StatelessWidget {
  const StepLocation({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AddPropertyProvider>();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: FormSection(
        title: 'Seleccione la ubicación de la propiedad',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Indíquenos la ubicación de su propiedad.',
              style: AppTextStyles.body,
            ),
            const SizedBox(height: AppSpacing.md),

            AppSearchInput(
              hintText: 'Buscar ubicación...',
              controller: provider.searchAddressController,
              onChanged: (value) async {
                if (value.length < 3) return;

                provider.setPlaces(
                  await OpenStreetMapService.searchPlaces(value),
                );
              },
            ),

            const SizedBox(height: 8),
            _AutocompleteList(),
            const SizedBox(height: AppSpacing.md),

            _MapPreview(),
            const SizedBox(height: AppSpacing.md),
            _SelectedLocation(),
            // const SizedBox(height: AppSpacing.md),
            // _LocationForm(),
          ],
        ),
      ),
    );
  }
}

class _MapPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AddPropertyProvider>();

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        height: 220,
        child: provider.latitude == null
            ? Container(
                color: Colors.grey.shade300,
                alignment: Alignment.center,
                child: const Text('Seleccione una ubicación'),
              )
            : FlutterMap(
                options: MapOptions(
                  initialCenter: LatLng(
                    provider.latitude!,
                    provider.longitude!,
                  ),
                  initialZoom: 15,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'real_estate_app',
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: LatLng(provider.latitude!, provider.longitude!),
                        width: 40,
                        height: 40,
                        child: const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}

class _SelectedLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AddPropertyProvider>();

    if (provider.address == null) return const SizedBox();

    return Row(
      children: [
        const Icon(Icons.location_on, color: Colors.orange),
        const SizedBox(width: 8),
        Expanded(
          child: Text(provider.address!, style: const TextStyle(fontSize: 14)),
        ),
      ],
    );
  }
}

class _AutocompleteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AddPropertyProvider>();

    if (provider.places.isEmpty) return const SizedBox();

    return Column(
      children: provider.places.map((place) {
        return ListTile(
          leading: const Icon(Icons.location_on_outlined),
          title: Text(place.address, style: const TextStyle(fontSize: 14)),
          subtitle: Text(
            '${place.city}, ${place.state}, ${place.country}',
            style: const TextStyle(fontSize: 12),
          ),
          onTap: () {
            provider.selectPlace(place);

            provider.setResolvedLocation(lat: place.lat!, lng: place.lng!);
          },
        );
      }).toList(),
    );
  }
}

class _LocationForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AddPropertyProvider>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Datos de ubicación', style: AppTextStyles.body),
        const SizedBox(height: 8),
        AppTextField(
          label: 'Dirección',
          controller: TextEditingController(text: provider.address ?? ''),
          hint: 'Ej: Calle 123 #45-67',
        ),
        const SizedBox(height: 8),
        AppTextField(
          label: 'Ciudad',
          controller: TextEditingController(text: provider.city ?? ''),
        ),
        const SizedBox(height: 8),
        AppTextField(
          label: 'Estado / Provincia',
          controller: TextEditingController(text: provider.state ?? ''),
        ),
        const SizedBox(height: 8),
        AppTextField(
          label: 'Pais',
          controller: TextEditingController(text: provider.country ?? ''),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: AppTextField(
                label: 'Latitud',
                controller: TextEditingController(
                  text: provider.latitude?.toStringAsFixed(6) ?? '',
                ),
                hint: 'Ej: -34.603722',
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: AppTextField(
                label: 'Longitud',
                controller: TextEditingController(
                  text: provider.longitude?.toStringAsFixed(6) ?? '',
                ),
                hint: 'Ej: -58.381592',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
