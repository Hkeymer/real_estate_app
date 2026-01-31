import 'package:flutter/material.dart';

import 'package:real_estate_app/core/theme/app_spacing.dart';
import 'package:real_estate_app/core/widgets/buttons/primary_button.dart';

import 'package:real_estate_app/features/property/widgets/contact_section.dart';
import 'package:real_estate_app/features/property/widgets/property_description.dart';
import 'package:real_estate_app/features/property/widgets/property_details_table.dart';
import 'package:real_estate_app/features/property/widgets/property_features.dart';
// import 'package:real_estate_app/features/property/widgets/property_gallery.dart';
import 'package:real_estate_app/features/property/widgets/property_header.dart';
import 'package:real_estate_app/features/property/widgets/property_header_info.dart';
import 'package:real_estate_app/features/property/widgets/property_highlights.dart';
import 'package:real_estate_app/features/property/widgets/property_location_map.dart';

class PropertyDetailScreen extends StatefulWidget {
  const PropertyDetailScreen({Key? key}) : super(key: key);

  @override
  State<PropertyDetailScreen> createState() => _PropertyDetailScreenState();
}

class _PropertyDetailScreenState extends State<PropertyDetailScreen> {
  final List<String> selectedFeatures = [];

  final List<FeatureItem> features = [
    FeatureItem(label: 'Parking', icon: Icons.car_repair),
    FeatureItem(label: 'Balcony', icon: Icons.balcony),
    FeatureItem(label: 'Pool', icon: Icons.pool),
    FeatureItem(label: 'Air Conditioning', icon: Icons.ac_unit),
    FeatureItem(label: 'Elevator', icon: Icons.elevator),
    FeatureItem(label: 'Swimming Pool', icon: Icons.pool_sharp),
    FeatureItem(label: 'Gym', icon: Icons.fitness_center),
  ];

  void toggleFeature(String feature) {
    setState(() {
      selectedFeatures.contains(feature)
          ? selectedFeatures.remove(feature)
          : selectedFeatures.add(feature);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const _ContactCTA(),
      body: CustomScrollView(
        slivers: [
          const PropertyHeader(),
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: AppSpacing.md),
                PropertyHeaderInfo(),
                SizedBox(height: AppSpacing.md),
                PropertyHighlights(),
                SizedBox(height: AppSpacing.md),
                PropertyDescription(
                  description:
                      'Perfecto. Aquí lo correcto NO es truncar texto “a lo bruto”, sino implementar un patrón Show more / Show less elegante, animado y profesional, como en apps reales (Airbnb, Zillow, Facebook).',
                ),
                SizedBox(height: AppSpacing.md),
                // PropertyGallery(),
                PropertyLocationMap(),
                SizedBox(height: AppSpacing.md),
                PropertyDetailsTable(),
                SizedBox(height: AppSpacing.md),
                PropertyFeatures(
                  onToggle: toggleFeature,
                  selected: selectedFeatures,
                  features: features,
                ),
                SizedBox(height: AppSpacing.md),
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
        child:
            //  ElevatedButton(
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: AppColors.primary,
            //     foregroundColor: AppColors.surface,
            //     minimumSize: const Size.fromHeight(52),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(AppRadius.lg),
            //     ),
            //   ),
            //   onPressed: () {},
            //   child: const Text('Schedule Visit'),
            // ),
            PrimaryButton(onPressed: () {}, text: 'Schedule Visit'),
      ),
    );
  }
}
