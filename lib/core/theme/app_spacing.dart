class AppSpacing {
  static const double xxs = 4;   // micro spacing
  static const double xs  = 8;
  static const double sm  = 12;
  static const double md  = 16;
  static const double lg  = 24;
  static const double xl  = 32;
  static const double xxl = 40;
}

// Uso recomendado:
// Padding(
//   padding: const EdgeInsets.all(AppSpacing.md),
//   child: Column(
//     children: [
//       Text('Título'),
//       SizedBox(height: AppSpacing.sm),
//       Text('Descripción'),
//     ],
//   ),
// );
