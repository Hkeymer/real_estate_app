import 'package:flutter/material.dart';

class AppShadows {
  static const List<BoxShadow> sm = [
    BoxShadow(
      color: Color(0x14000000),
      blurRadius: 8,
      offset: Offset(0, 2),
    ),
  ];

  static const List<BoxShadow> md = [
    BoxShadow(
      color: Color(0x1A000000),
      blurRadius: 12,
      offset: Offset(0, 6),
    ),
  ];

  static const List<BoxShadow> lg = [
    BoxShadow(
      color: Color(0x24000000),
      blurRadius: 20,
      offset: Offset(0, 10),
    ),
  ];
}


// Uso recomendado:
// Container(
//   decoration: BoxDecoration(
//     color: AppColors.surface,
//     borderRadius: BorderRadius.circular(AppRadius.lg),
//     boxShadow: AppShadows.md,
//   ),
// )
