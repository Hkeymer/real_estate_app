import 'package:flutter/material.dart';
import 'package:real_estate_app/core/theme/app_theme.dart';

import 'features/navigation/app_shell.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Real Estate App',
      theme: AppTheme.lightTheme,
      home: const AppShell(),
    );
  }
}
