import 'package:flutter/material.dart';

import '../model/project_list.dart';
import '../model/project_model.dart';
import '../utils/constants/colors.dart';
import '../utils/constants/image_strings.dart';
import '../utils/constants/sizes.dart';
import '../utils/constants/text_strings.dart';
import '../utils/helpers/project_sort_helper.dart';
import 'widget/project_card.dart';
import 'widget/social_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1400),
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LayoutBuilder(
                    builder: (context, constraints) {
                      bool isWideScreen = constraints.maxWidth >= 600;

                      return isWideScreen
                          ? Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(child: _buildTextSection(context)),
                                const SizedBox(width: SSizes.spaceBtwSection),
                                _buildProfileImage(),
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                _buildProfileImage(),
                                const SizedBox(height: SSizes.spaceBtwSection),
                                _buildTextSection(context),
                              ],
                            );
                    },
                  ),

                  const SizedBox(height: SSizes.spaceBtwItems * 2),
                  const SelectableText(
                    "Let's See My Project",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: SSizes.spaceBtwItems),

                  LayoutBuilder(
                    builder: (context, constraints) {
                      const double spacing = 20;
                      int columnCount = constraints.maxWidth > 800 ? 2 : 1;
                      double totalSpacing = spacing * (columnCount - 1);
                      double itemWidth =
                          (constraints.maxWidth - totalSpacing) / columnCount;

                      final List<ProjectModel> sortedProjects = [...projectList]
                        ..sort((a, b) {
                          final DateTime aDate =
                              parseEndDate(a.duration) ?? DateTime(1900);
                          final DateTime bDate =
                              parseEndDate(b.duration) ?? DateTime(1900);
                          return bDate.compareTo(aDate);
                        });

                      return Wrap(
                        spacing: spacing,
                        runSpacing: spacing,
                        children: sortedProjects.map((project) {
                          return SizedBox(
                            width: itemWidth,
                            child: ProjectCard(
                              title: project.title,
                              description: project.description,
                              githubUrl: project.githubUrl,
                              thumbnail: project.thumbnail,
                              youtubebUrl: project.youtubeUrl,
                              documentUrl: project.documentUrl,
                              duration: project.duration,
                              language: project.language,
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            bool isMobile = constraints.maxWidth < 800;

            return isMobile
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText(
                        STexts.name,
                        style: Theme.of(context).textTheme.headlineMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: SSizes.spaceBtwItems),
                      SelectableText(
                        'Mobile Developer | Machine Learning',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: SColors.grey,
                        ),
                      ),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SelectableText(
                        STexts.name,
                        style: Theme.of(context).textTheme.headlineMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: SSizes.spaceBtwSection),
                      SelectableText(
                        'Mobile Developer | Machine Learning',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: SColors.grey,
                        ),
                      ),
                    ],
                  );
          },
        ),
        const SizedBox(height: SSizes.spaceBtwItems),

        SelectableText(
          STexts.description,
          textAlign: TextAlign.justify,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: SSizes.spaceBtwItems),

        const Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            SocialButton(
              url: 'https://github.com/penhele',
              label: STexts.github,
              iconPath: SImages.githubLogo,
            ),
            SocialButton(
              url: 'https://linkedin.com/in/stephenhelenus',
              label: STexts.linkedin,
              iconPath: SImages.linkedinLogo,
            ),
            SocialButton(
              url: 'https://instagram.com/stephenhelenus',
              label: STexts.instagram,
              iconPath: SImages.instagramLogo,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProfileImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        SImages.profilePhoto,
        height: 250,
        width: 270,
        fit: BoxFit.cover,
      ),
    );
  }
}
