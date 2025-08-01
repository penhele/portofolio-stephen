import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/constants/text_strings.dart';
import 'project_detail.dart';
import 'social_button.dart';

class ProjectCard extends StatefulWidget {
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
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 600;
        final double cardHeight = constraints.maxWidth >= 1200
            ? 350
            : (isMobile ? 400 : 500);

        final Matrix4 transformMatrix = Matrix4.identity();
        if (_isHovered) {
          transformMatrix.scale(1.02);
        }

        return MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => ProjectDetailScreen(
                  title: widget.title,
                  description: widget.description,
                  thumbnail: widget.thumbnail,
                  githubUrl: widget.githubUrl,
                  youtubebUrl: widget.youtubebUrl,
                  documentUrl: widget.documentUrl,
                  duration: widget.duration,
                  language: widget.language,
                ),
              );
            },
            child: Transform(
              transform: transformMatrix,
              alignment: Alignment.center,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                decoration: BoxDecoration(
                  color: SColors.white,
                  border: Border.all(color: SColors.black),
                  borderRadius: BorderRadius.circular(SSizes.radiusOutside),
                  boxShadow: _isHovered
                      ? [
                          BoxShadow(
                            color: SColors.black.withValues(alpha: 0.2),
                            blurRadius: 12,
                            offset: const Offset(0, 8),
                          ),
                        ]
                      : [],
                ),
                child: Container(
                  height: cardHeight,
                  decoration: BoxDecoration(
                    border: Border.all(color: SColors.black),
                    borderRadius: BorderRadius.circular(SSizes.radiusOutside),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(SSizes.paddingProjectDetail),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: SColors.grey,
                            borderRadius: BorderRadius.circular(
                              SSizes.radiusInside,
                            ),
                          ),
                          child: Image.asset(
                            widget.thumbnail,
                            width: double.infinity,
                            height: isMobile ? 150 : 300,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: SSizes.spaceBtwItems),

                        Row(
                          children: [
                            SelectableText(
                              widget.title,
                              style: Theme.of(context).textTheme.titleMedium!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),

                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: SColors.primary,
                                borderRadius: BorderRadius.circular(
                                  SSizes.radiusInside,
                                ),
                              ),
                              child: SelectableText(
                                widget.duration,
                                style: Theme.of(context).textTheme.bodyMedium!
                                    .copyWith(
                                      color: isDark
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                              ),
                            ),
                          ],
                        ),

                        const Divider(),

                        Text(
                          widget.description,
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
                                if (widget.githubUrl != null)
                                  SocialButton(
                                    url: widget.githubUrl!,
                                    label: STexts.github,
                                    iconPath: SImages.githubLogo,
                                  ),

                                if (widget.youtubebUrl != null) ...[
                                  const SizedBox(width: SSizes.spaceBtwMenu),

                                  SocialButton(
                                    url: widget.youtubebUrl!,
                                    label: STexts.youtube,
                                    iconPath: SImages.youtubeLogo,
                                  ),
                                ],

                                if (widget.documentUrl != null) ...[
                                  const SizedBox(width: SSizes.spaceBtwMenu),

                                  SocialButton(
                                    url: widget.documentUrl!,
                                    label: STexts.document,
                                    iconPath: SImages.documentLogo,
                                  ),
                                ],
                              ],
                            ),
                            if (widget.language != null)
                              Row(
                                spacing: SSizes.spaceBtwMenu,
                                children: widget.language!,
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
