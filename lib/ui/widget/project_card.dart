import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/constants/text_strings.dart';
import 'social_button.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.githubUrl,
    required this.title,
    required this.description,
    required this.thumbnail,
    this.youtubebUrl,
    this.documentUrl,
    required this.duration,
    this.language,
  });

  final String title;
  final String description;
  final String thumbnail;
  final String? githubUrl;
  final String? youtubebUrl;
  final String? documentUrl;
  final String duration;
  final List<Widget>? language;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 600;
        final double cardHeight = constraints.maxWidth >= 1200
            ? 350
            : (isMobile ? 400 : 500);

        return Container(
          height: cardHeight,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: SColors.grey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.asset(
                    thumbnail,
                    width: double.infinity,
                    height: isMobile ? 150 : 300,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: SSizes.spaceBtwItems),
                Row(
                  children: [
                    SelectableText(
                      title,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.indigo.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: SelectableText(
                        duration,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Text(
                  description,
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                ),
                const Spacer(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        if (githubUrl != null)
                          SocialButton(
                            url: githubUrl!,
                            label: STexts.github,
                            iconPath: SImages.githubLogo,
                          ),

                        if (youtubebUrl != null)
                          const SizedBox(width: SSizes.spaceBtwMenu),

                        if (youtubebUrl != null)
                          SocialButton(
                            url: youtubebUrl!,
                            label: STexts.youtube,
                            iconPath: SImages.youtubeLogo,
                          ),

                        if (documentUrl != null)
                          const SizedBox(width: SSizes.spaceBtwMenu),

                        if (documentUrl != null)
                          SocialButton(
                            url: documentUrl!,
                            label: STexts.document,
                            iconPath: SImages.documentLogo,
                          ),
                      ],
                    ),
                    if (language != null)
                      Row(spacing: SSizes.spaceBtwMenu, children: language!),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
