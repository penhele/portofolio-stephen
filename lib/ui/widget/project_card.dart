import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';
import '../../utils/constants/sizes.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.githubUrl,
    required this.title,
    required this.description,
    required this.thumbnail,
    this.youtubebUrl,
  });

  final String title;
  final String description;
  final String thumbnail;
  final String githubUrl;
  final String? youtubebUrl;

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
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(),
                Text(
                  description,
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                ),
                Spacer(),

                Row(
                  children: [
                    InkWell(
                      onTap: () async {
                        final Uri url = Uri.parse(githubUrl);
                        if (await canLaunchUrl(url)) {
                          await launchUrl(
                            url,
                            mode: LaunchMode.externalApplication,
                          );
                        }
                      },
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(SImages.githubLogo, height: 20),
                          ),
                          const SizedBox(width: SSizes.spaceBtwMenu),
                          const Text('Github'),
                        ],
                      ),
                    ),

                    if (youtubebUrl != null)
                      const SizedBox(width: SSizes.spaceBtwMenu),

                    if (youtubebUrl != null)
                      InkWell(
                        onTap: () async {
                          final Uri url = Uri.parse(youtubebUrl!);
                          if (await canLaunchUrl(url)) {
                            await launchUrl(
                              url,
                              mode: LaunchMode.externalApplication,
                            );
                          }
                        },
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                SImages.youtubeLogo,
                                height: 20,
                              ),
                            ),
                            const SizedBox(width: SSizes.spaceBtwMenu),
                            const Text('Github'),
                          ],
                        ),
                      ),
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
