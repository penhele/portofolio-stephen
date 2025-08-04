import 'package:flutter/material.dart';

import '../../model/project_list.dart';
import '../../model/project_model.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/project_sort_helper.dart';
import '../widget/project_card.dart';
import '../widget/title_section.dart';

class AllProjectScreen extends StatelessWidget {
  const AllProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < SSizes.mobileScreenSize;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1400),

            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 32,
                horizontal: isMobile ? 16 : 32,
              ),

              child: LayoutBuilder(
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

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              width: 50,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: SColors.primary,
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: const Icon(
                                Icons.arrow_back_ios_new,
                                color: SColors.white,
                              ),
                            ),
                          ),
                          Align(
                            alignment: isMobile
                                ? Alignment.centerRight
                                : Alignment.center,
                            child: const TitleSection(title: 'All Project'),
                          ),
                        ],
                      ),
                      const SizedBox(height: SSizes.spaceBtwItems),

                      Wrap(
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
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
