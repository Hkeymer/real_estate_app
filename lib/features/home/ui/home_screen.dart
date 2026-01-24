import 'package:flutter/material.dart';
import 'package:real_estate_app/features/home/widgets/categories_row.dart';
import 'package:real_estate_app/features/home/widgets/home_header.dart';
import 'package:real_estate_app/features/home/widgets/featured_properties.dart';
import 'package:real_estate_app/features/home/widgets/properties_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              HomeHeader(),
              SizedBox(height: 24),
              // CategoriesRow(),
              // SizedBox(height: 24),
              FeaturedProperties(),
              SizedBox(height: 24),
              PropertiesList(),
            ],
          ),
        ),
      ),
    );
  }
}
