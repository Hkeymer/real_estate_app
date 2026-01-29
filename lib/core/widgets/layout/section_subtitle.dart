import 'package:flutter/material.dart';

class SectionSubtitle extends StatelessWidget {
  final String title;

  const SectionSubtitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(title, style: Theme.of(context).textTheme.titleMedium)],
    );
  }
}
