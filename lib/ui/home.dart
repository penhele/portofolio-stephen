import 'package:flutter/material.dart';

import '../utils/constants/sizes.dart';
import 'widget/project_card.dart';
import 'widget/social_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1400),
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Stephen Helenus',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: SSizes.spaceBtwItems),

                  const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ...',
                    textAlign: TextAlign.justify,
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
                        iconPath: 'assets/github.png',
                      ),
                      SocialButton(
                        url: 'https://linkedin.com/in/stephenhelenus',
                        label: 'Linkedin',
                        iconPath: 'assets/linkedin.png',
                      ),
                    ],
                  ),

                  const SizedBox(height: SSizes.spaceBtwItems * 2),
                  const Text(
                    "Let's Look at My Awesome Project",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: SSizes.spaceBtwItems),

                  LayoutBuilder(
                    builder: (context, constraints) {
                      int columnCount = 1;
                      if (constraints.maxWidth > 800) {
                        columnCount = 2;
                      }

                      return Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        children: [
                          SizedBox(
                            width: constraints.maxWidth / columnCount - 20,
                            child: const ProjectCard(
                              title: 'Story App',
                              description:
                                  'Story App adalah aplikasi mobile yang memungkinkan pengguna untuk mengunggah dan melihat foto melalui koneksi ke API publik...',
                              url: 'https://github.com/penhele/story_app_final',
                            ),
                          ),
                          SizedBox(
                            width: constraints.maxWidth / columnCount - 20,
                            child: const ProjectCard(
                              title: 'Palindrome App',
                              description:
                                  'Aplikasi Flutter yang dapat mengecek palindrom, fetch nama dari API, dan mendukung multi-language.',
                              url: 'https://github.com/penhele/palindrome_app',
                            ),
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
