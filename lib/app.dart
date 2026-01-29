import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_app/features/navigation/app_shell.dart';

import 'core/theme/app_theme.dart';
import 'providers/providers.dart';

class RealEstateApp extends StatelessWidget {
  const RealEstateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: appProviders,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Real Estate App',
        theme: AppTheme.lightTheme,
        home: AppShell(),
      ),
    );
  }
}
