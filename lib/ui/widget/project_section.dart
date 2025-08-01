import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/project_list.dart';
import '../../model/project_model.dart';
import '../../provider/show_more_provider.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/project_sort_helper.dart';
import 'project_card.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ShowMoreProvider>();

    if (!provider.initialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        const double spacing = 20;
        int columnCount = constraints.maxWidth > 800 ? 2 : 1;
        double totalSpacing = spacing * (columnCount - 1);
        double itemWidth = (constraints.maxWidth - totalSpacing) / columnCount;

        final List<ProjectModel> sortedProjects = [...projectList]
          ..sort((a, b) {
            final DateTime aDate = parseEndDate(a.duration) ?? DateTime(1900);
            final DateTime bDate = parseEndDate(b.duration) ?? DateTime(1900);
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

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(),
                onPressed: () => provider.toggle(),
                child: Text(showAll ? 'Show Less' : 'Show More'),
              ),
            ),
          ],
        );
      },
    );
  }
}
