import 'package:flutter/material.dart';

import 'package:real_estate_app/core/theme/app_spacing.dart';
import 'package:real_estate_app/core/widgets/buttons/primary_button.dart';
import 'package:real_estate_app/core/constants/amenities_catalog.dart';

import 'package:real_estate_app/features/property/widgets/contact_section.dart';
import 'package:real_estate_app/features/property/widgets/property_description.dart';
import 'package:real_estate_app/features/property/widgets/property_details_table.dart';
import 'package:real_estate_app/features/property/widgets/property_features.dart';
import 'package:real_estate_app/features/property/widgets/property_header_info.dart';
import 'package:real_estate_app/features/property/widgets/property_image_hero_sliver.dart';
import 'package:real_estate_app/features/property/widgets/property_header_sliver.dart';
import 'package:real_estate_app/features/property/widgets/property_highlights.dart';
import 'package:real_estate_app/features/property/widgets/property_location_map.dart';

class PropertyDetailScreen extends StatefulWidget {
  const PropertyDetailScreen({super.key});

  @override
  State<PropertyDetailScreen> createState() => _PropertyDetailScreenState();
}

class _PropertyDetailScreenState extends State<PropertyDetailScreen> {
  final List<String> selectedFeatures = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const _ContactCTA(),
      body: CustomScrollView(
        slivers: [
          const PropertyAppHeaderSliver(),
          const PropertyImageHeroSliver(),
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: AppSpacing.md),
                PropertyHeaderInfo(),
                SizedBox(height: AppSpacing.lg),
                PropertyHighlights(),
                SizedBox(height: AppSpacing.lg),
                PropertyDescription(
                  description:
                      'Perfecto. Aquí lo correcto NO es truncar texto “a lo bruto”, sino implementar un patrón Show more / Show less elegante, animado y profesional, como en apps reales (Airbnb, Zillow, Facebook).',
                ),
                SizedBox(height: AppSpacing.lg),
                // PropertyGallery(),
                PropertyLocationMap(),
                SizedBox(height: AppSpacing.lg),
                PropertyDetailsTable(),
                SizedBox(height: AppSpacing.lg),
                PropertyFeatures(features: amenitiesCatalog),
                SizedBox(height: AppSpacing.lg),
                ContactSection(),
                SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactCTA extends StatelessWidget {
  const _ContactCTA();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: PrimaryButton(onPressed: () {}, text: 'Programar una visita'),
      ),
    );
  }
}
