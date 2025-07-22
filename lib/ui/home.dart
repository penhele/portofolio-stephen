import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/project_list.dart';
import '../model/project_model.dart';
import '../provider/show_more_provider.dart';
import '../utils/constants/sizes.dart';
import '../utils/helpers/project_sort_helper.dart';
import 'widget/profile_image.dart';
import 'widget/profile_text.dart';
import 'widget/project_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ShowMoreProvider>();

    if (!provider.initialized) {
      return const Center(child: CircularProgressIndicator());
    }

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
                          ? const Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(child: ProfileText()),
                                SizedBox(width: SSizes.spaceBtwSection),
                                ProfileImage(),
                              ],
                            )
                          : const Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ProfileImage(),
                                SizedBox(height: SSizes.spaceBtwSection),
                                ProfileText(),
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

                      final showAll = provider.showAll;
                      final List<ProjectModel> visibleProjects = showAll
                          ? sortedProjects
                          : sortedProjects.take(6).toList();

                      return Column(
                        children: [
                          Wrap(
                            spacing: spacing,
                            runSpacing: spacing,
                            children: visibleProjects.map((project) {
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
                          const SizedBox(height: SSizes.spaceBtwSection),

                          ElevatedButton(
                            onPressed: () => provider.toggle(),
                            child: Text(showAll ? 'Show Less' : 'Show More'),
                          ),
                        ],
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
}
