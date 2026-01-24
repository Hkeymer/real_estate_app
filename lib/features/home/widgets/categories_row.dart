import 'package:flutter/material.dart';
import 'package:real_estate_app/core/widgets/buttons/icon_text_chip_button.dart';

class CategoryItem {
  final String title;
  final IconData icon;

  CategoryItem(this.title, this.icon);
}

class CategoriesRow extends StatefulWidget {
  const CategoriesRow({super.key});

  @override
  State<CategoriesRow> createState() => _CategoriesRowState();
}

class _CategoriesRowState extends State<CategoriesRow> {
  int selectedIndex = 0;

  final List<CategoryItem> categories = [
    CategoryItem('Venta', Icons.sell),
    CategoryItem('Alquiler', Icons.key),
    CategoryItem('Casas', Icons.home),
    CategoryItem('Apartamentos', Icons.apartment),
    CategoryItem('Terrenos', Icons.landscape),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final category = categories[index];

          return IconTextChipButton(
            icon: category.icon,
            label: category.title,
            isSelected: selectedIndex == index,
            onTap: () {
              setState(() {
                selectedIndex = index;
              });

              // aquí luego conectas el filtro real
            },
          );
        },
      ),
    );
  }
}
