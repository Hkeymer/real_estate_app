import 'package:flutter/material.dart';
import 'package:real_estate_app/core/theme/app_spacing.dart';

import 'package:real_estate_app/core/widgets/buttons/icon_button_circle.dart';

import 'package:real_estate_app/core/theme/app_colors.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.xs),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Buscar propiedades...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: AppColors.surface,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: AppSpacing.sm,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSpacing.lg),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          IconButtonCircle(
            icon: Icons.tune,
            onTap: () {
              // abrir filtros
            },
          ),
        ],
      ),
    );
  }
}
