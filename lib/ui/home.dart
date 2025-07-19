import 'package:flutter/material.dart';

import '../model/project_list.dart';
import '../utils/constants/image_strings.dart';
import '../utils/constants/sizes.dart';
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
                  const Text(
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

                      return Wrap(
                        spacing: spacing,
                        runSpacing: spacing,
                        children: projectList.map((project) {
                          return SizedBox(
                            width: itemWidth,
                            child: ProjectCard(
                              title: project.title,
                              description: project.description,
                              githubUrl: project.githubUrl,
                              thumbnail: project.thumbnail,
                              youtubebUrl: project.youtubeUrl,
                              documentUrl: project.documentUrl,
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
        Text(
          'Stephen Helenus',
          style: Theme.of(
            context,
          ).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: SSizes.spaceBtwItems),

        Text(
          'A passionate Informatics student from Universitas Gunadarma with strong experience in mobile development using Flutter and Dart. Built full-cycle applications with Firebase integration and implemented various mobile features. Currently seeking a Mobile Developer internship to apply and expand my skills in a real-world environment.',
          textAlign: TextAlign.justify,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: SSizes.spaceBtwItems),

        OutlinedButton(onPressed: () {}, child: const Text('CV')),
        const SizedBox(height: SSizes.spaceBtwItems),

        const Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            SocialButton(
              url: 'https://github.com/penhele',
              label: 'Github',
              iconPath: SImages.githubLogo,
            ),
            SocialButton(
              url: 'https://linkedin.com/in/stephenhelenus',
              label: 'Linkedin',
              iconPath: SImages.linkedinLogo,
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
