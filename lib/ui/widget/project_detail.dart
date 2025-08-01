import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/constants/text_strings.dart';
import 'social_button.dart';

class ProjectDetailScreen extends StatelessWidget {
  const ProjectDetailScreen({
    super.key,
    required this.title,
    required this.description,
    required this.thumbnail,
    required this.duration,
    this.githubUrl,
    this.youtubebUrl,
    this.documentUrl,
    this.language,
  });

  final String title;
  final String description;
  final String thumbnail;
  final String duration;
  final String? githubUrl;
  final String? youtubebUrl;
  final String? documentUrl;
  final List<Widget>? language;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Dialog(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600, minWidth: 300),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(SSizes.paddingProjectDetail),
            child: Column(
              children: [
                LayoutBuilder(
                  builder: (context, constraints) {
                    double imageWidth = constraints.maxWidth;

                    return Image.asset(
                      thumbnail,
                      width: imageWidth,
                      fit: BoxFit.contain,
                    );
                  },
                ),
                const SizedBox(height: SSizes.spaceBtwItems),

                SelectableText(
                  title,
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                const Divider(),

                SelectableText(
                  description,
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: SSizes.spaceBtwSection),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        if (githubUrl != null)
                          SocialButton(
                            url: githubUrl!,
                            label: STexts.github,
                            iconPath: isDark
                                ? SImages.githubDarkLogo
                                : SImages.githubLogo,
                          ),

                        if (youtubebUrl != null) ...[
                          const SizedBox(width: SSizes.spaceBtwMenu),

                          SocialButton(
                            url: youtubebUrl!,
                            label: STexts.youtube,
                            iconPath: SImages.youtubeLogo,
                          ),
                        ],

                        if (documentUrl != null) ...[
                          const SizedBox(width: SSizes.spaceBtwMenu),

                          SocialButton(
                            url: documentUrl!,
                            label: STexts.document,
                            iconPath: SImages.documentLogo,
                          ),
                        ],
                      ],
                    ),
                    if (language != null)
                      Row(spacing: SSizes.spaceBtwMenu, children: language!),
                  ],
                ),
                const SizedBox(height: SSizes.spaceBtwSection),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: SColors.primary,
                    borderRadius: BorderRadius.circular(SSizes.radiusInside),
                  ),
                  child: SelectableText(
                    duration,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium!.copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
