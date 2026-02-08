import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  final String? title;
  final VoidCallback? onBack;
  final VoidCallback? onShare;
  final VoidCallback? onFavorite;

  const AppHeader({
    super.key,
    this.title,
    this.onBack,
    this.onShare,
    this.onFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Color(0xFFE5E5E5))),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // TÍTULO (OPCIONAL)
          if (title != null)
            Text(
              title!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),

          // ICONOS
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left, size: 28),
                onPressed: onBack ?? () => Navigator.pop(context),
              ),
              Row(
                children: [
                  if (onShare != null)
                    IconButton(
                      icon: const Icon(Icons.share),
                      onPressed: onShare,
                    ),
                  if (onFavorite != null)
                    IconButton(
                      icon: const Icon(Icons.favorite_border),
                      onPressed: onFavorite,
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
