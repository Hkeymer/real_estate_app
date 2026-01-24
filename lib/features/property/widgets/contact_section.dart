import 'package:flutter/material.dart';
import 'package:real_estate_app/core/theme/app_radius.dart';
import 'package:real_estate_app/core/theme/app_spacing.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:real_estate_app/core/theme/app_colors.dart';
import 'package:real_estate_app/core/theme/app_text_styles.dart';
import 'package:real_estate_app/core/widgets/layout/section_title.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  Future<void> _openWhatsApp() async {
    final uri = Uri.parse(
      'https://wa.me/573001234567?text=${Uri.encodeComponent('Hello, I am interested in this property.')}',
    );

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch WhatsApp';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(title: 'Contact'),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.divider,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                /// Agent info
                Row(
                  children: [
                    const CircleAvatar(radius: 24),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('John Doe', style: AppTextStyles.title),
                        const SizedBox(height: 4),
                        Text('Real Estate Agent', style: AppTextStyles.body),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                /// Contact agent (neutral)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: AppColors.background,
                      foregroundColor: AppColors.textPrimary,
                      side: BorderSide(color: AppColors.secondary),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppRadius.md),
                      ),
                    ),
                    icon: const Icon(Icons.message, size: 22),
                    label: Text(
                      'Contact Agent',
                      style: AppTextStyles.body.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                /// WhatsApp CTA
                // SizedBox(
                //   width: double.infinity,
                //   child: ElevatedButton.icon(
                //     onPressed: _openWhatsApp,
                //     style: ElevatedButton.styleFrom(
                //       elevation: 0,
                //       backgroundColor: AppColors.success,
                //       foregroundColor: AppColors.background,
                //       side: BorderSide(color: AppColors.success),
                //       padding: const EdgeInsets.symmetric(vertical: 14),
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(14),
                //       ),
                //     ),
                //     icon: const Icon(
                //       FontAwesomeIcons.whatsapp,
                //       size: 22,
                //       color: AppColors.background,
                //     ),
                //     label: Text(
                //       'Send WhatsApp',
                //       style: AppTextStyles.body.copyWith(
                //         fontWeight: FontWeight.w600,
                //         color: AppColors.background,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
