import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_app/features/add_property/provider/add_property_provider.dart';
import 'package:real_estate_app/features/add_property/steps/step_basic_info.dart';
import 'package:real_estate_app/features/add_property/steps/step_details.dart';
import 'package:real_estate_app/features/add_property/steps/step_location.dart';
import 'package:real_estate_app/features/add_property/steps/step_property_type.dart';
import 'package:real_estate_app/features/add_property/widgets/step_header.dart';

import 'package:real_estate_app/core/widgets/buttons/primary_button.dart';

class AddPropertyScreen extends StatefulWidget {
  const AddPropertyScreen({super.key});

  @override
  State<AddPropertyScreen> createState() => _AddPropertyScreenState();
}

class _AddPropertyScreenState extends State<AddPropertyScreen> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AddPropertyProvider>();

    return Scaffold(
      body: Column(
        children: [
          const StepHeader(),

          /// STEPS
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: provider.goToStep,
              children: const [
                StepBasicInfo(),
                StepPropertyType(),
                StepDetails(),
                StepLocation(),
              ],
            ),
          ),

          /// CONTINUE BUTTON
          Padding(
            padding: const EdgeInsets.all(16),
            child: PrimaryButton(
              text: provider.currentStep == AddPropertyProvider.totalSteps - 1
                  ? 'Finish'
                  : 'Continue',
              onPressed: () {
                provider.submitStep();

                if (provider.isStepValid(0)) {
                  provider.nextStep();
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
