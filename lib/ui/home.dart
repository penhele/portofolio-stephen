import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/theme_controller.dart';
import '../utils/constants/colors.dart';
import '../utils/constants/sizes.dart';
import 'widget/profile_image.dart';
import 'widget/profile_text.dart';
import 'widget/project_section.dart';

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
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: SColors.primary,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                            color: const Color(0xff2a4d31),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Center(
                              child: SelectableText(
                                'Portofolio',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 45,
                          width: 45,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: GetBuilder<ThemeController>(
                            builder: (controller) => IconButton(
                              onPressed: () => controller.toggleTheme(),
                              icon: Icon(
                                controller.isDarkMode
                                    ? Icons.light_mode
                                    : Icons.dark_mode,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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

                  const SelectableText(
                    "Let's See My Project",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: SSizes.spaceBtwItems),

                  const ProjectSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
