import 'package:flutter/material.dart';

import '../utils/constants/sizes.dart';
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

                  const SelectableText(
                    "",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: SSizes.spaceBtwItems),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
