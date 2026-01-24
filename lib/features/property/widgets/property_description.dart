import 'package:flutter/material.dart';
import 'package:real_estate_app/core/theme/app_spacing.dart';
import 'package:real_estate_app/core/theme/app_text_styles.dart';
import 'package:real_estate_app/core/widgets/layout/section_title.dart';

class PropertyDescription extends StatefulWidget {
  final String description;

  const PropertyDescription({
    super.key,
    required this.description,
  });

  @override
  State<PropertyDescription> createState() => _PropertyDescriptionState();
}

class _PropertyDescriptionState extends State<PropertyDescription>
    with SingleTickerProviderStateMixin {
  bool _expanded = false;
  static const int _maxLines = 3;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(title: 'Description'),
          const SizedBox(height: AppSpacing.sm),

          /// Texto con animación
          AnimatedSize(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            child: Text(
              widget.description,
              style: AppTextStyles.body,
              maxLines: _expanded ? null : _maxLines,
              overflow: _expanded ? TextOverflow.visible : TextOverflow.ellipsis,
            ),
          ),

          const SizedBox(height: AppSpacing.xs),

          /// Botón Show more / less
          _ShowMoreButton(
            expanded: _expanded,
            onTap: () {
              setState(() => _expanded = !_expanded);
            },
          ),
        ],
      ),
    );
  }
}

class _ShowMoreButton extends StatelessWidget {
  final bool expanded;
  final VoidCallback onTap;

  const _ShowMoreButton({
    required this.expanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        expanded ? 'Show less' : 'Show more',
        style: AppTextStyles.body.copyWith(
          fontWeight: FontWeight.w600,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
