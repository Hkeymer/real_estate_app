import 'package:flutter/material.dart';
import 'bottom_nav_bar.dart';

import 'package:real_estate_app/features/add_property/ui/add_property_screen.dart';
import 'package:real_estate_app/features/home/ui/home_screen.dart';
import 'package:real_estate_app/features/notifications/ui/notifications_screen.dart';
import 'package:real_estate_app/features/profile/ui/profile_screen.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    AddPropertyScreen(),
    NotificationsScreen(),
    ProfileScreen(),
  ];

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabSelected,
      ),
    );
  }
}
