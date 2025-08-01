import 'package:flutter/material.dart';

import '../model/project_list.dart';
import '../utils/constants/colors.dart';
import '../utils/constants/sizes.dart';
import '../utils/helpers/project_utils.dart';
import 'widget/header_section.dart';
import 'widget/profile_image.dart';
import 'widget/profile_text.dart';
import 'widget/project_section.dart';
import 'widget/title_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1400),
            child: Padding(
              padding: EdgeInsets.all(isMobile ? 16 : 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeaderSection(),
                  const SizedBox(height: SSizes.spaceBtwItems * 2),

                  isMobile
                      ? const Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ProfileImage(),
                            SizedBox(height: SSizes.spaceBtwSection),
                            ProfileText(),
                          ],
                        )
                      : const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: ProfileText()),
                            SizedBox(width: SSizes.spaceBtwSection),
                            ProfileImage(),
                          ],
                        ),

                  const SizedBox(height: SSizes.spaceBtwItems * 2),

                  const TitleSection(title: "Let's See My Project"),
                  const SizedBox(height: SSizes.spaceBtwItems),

                  const ProjectSection(),
                  const SizedBox(height: SSizes.spaceBtwSection),

                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: SColors.secondary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Total Project',
                              style: Theme.of(context).textTheme.headlineSmall!
                                  .copyWith(color: SColors.white),
                            ),
                            const SizedBox(height: SSizes.spaceBtwMenu),

                            Text(
                              projectList.length.toString(),
                              style: Theme.of(context).textTheme.headlineLarge!
                                  .copyWith(color: SColors.white),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Most Used Languages',
                              style: Theme.of(context).textTheme.headlineSmall!
                                  .copyWith(color: SColors.white),
                            ),
                            const SizedBox(height: SSizes.spaceBtwMenu),

                            Row(
                              children: getMostUsedLanguages(projectList)
                                  .entries
                                  .take(3)
                                  .map(
                                    (entry) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 1,
                                        horizontal: 8,
                                      ),
                                      child: Image.asset(
                                        entry.key,
                                        height: 32,
                                        width: 32,
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ],
                        ),
                      ],
                    ),
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
