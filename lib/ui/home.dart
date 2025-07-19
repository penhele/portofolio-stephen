import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Stephen Helenus'),
                  const SizedBox(height: SSizes.spaceBtwItems),

                  const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  ),
                  const SizedBox(height: SSizes.spaceBtwItems),

                  OutlinedButton(onPressed: () {}, child: const Text('CV')),
                  const SizedBox(height: SSizes.spaceBtwItems),

                  Row(
                    children: [
                      InkWell(
                        onTap: () async {
                          final Uri githubUrl = Uri.parse(
                            'https://github.com/penhele',
                          );
                          if (await canLaunchUrl(githubUrl)) {
                            await launchUrl(
                              githubUrl,
                              mode: LaunchMode.externalApplication,
                            );
                          }
                        },
                        child: Row(
                          children: [
                            Image.asset('assets/github.png', height: 20),
                            const SizedBox(width: SSizes.spaceBtwMenu),
                            const Text('Github'),
                          ],
                        ),
                      ),
                      const SizedBox(width: SSizes.spaceBtwItems),
                      InkWell(
                        onTap: () async {
                          final Uri githubUrl = Uri.parse(
                            'https://linkedin.com/in/stephenhelenus',
                          );
                          if (await canLaunchUrl(githubUrl)) {
                            await launchUrl(
                              githubUrl,
                              mode: LaunchMode.externalApplication,
                            );
                          }
                        },
                        child: Row(
                          children: [
                            Image.asset('assets/linkedin.png', height: 20),
                            const SizedBox(width: SSizes.spaceBtwMenu),
                            const Text('Linkedin'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const Column(
                children: [
                  Text('Let\'s Look at My Awesome Project'),

                  Wrap(
                    spacing: 50,
                    children: [
                      ProjectCard(
                        title: 'Story App',
                        description:
                            'Story App adalah aplikasi mobile yang memungkinkan pengguna untuk mengunggah dan melihat foto melalui koneksi ke API publik. Aplikasi ini mengusung konsep mirip Instagram dengan penambahan beberapa fitur fungsional lainnya.',
                        url: 'https://github.com/penhele/story_app_final',
                      ),
                      ProjectCard(
                        title: 'Palindrome App',
                        description:
                            'Aplikasi ini merupakan aplikasi Flutter yang memiliki fitur utama untuk mengecek apakah sebuah kata atau kalimat merupakan palindrom. Selain itu, aplikasi ini juga dilengkapi dengan fitur untuk mengambil nama dari API publik serta fitur penggantian bahasa (multi-language) yang memungkinkan pengguna memilih bahasa sesuai preferensi.',
                        url: 'https://github.com/penhele/palindrome_app',
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.url,
    required this.title,
    required this.description,
  });

  final String url;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 500,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.0),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.network(
              'https://www.salamyogyakarta.com/wp-content/uploads/untitled.jpg',
              height: 200,
              width: 300,
              fit: BoxFit.cover,
            ),

            Column(children: [Text(title), const Divider(), Text(description)]),
            const SizedBox(height: SSizes.spaceBtwItems),

            InkWell(
              onTap: () async {
                final Uri githubUrl = Uri.parse(url);
                if (await canLaunchUrl(githubUrl)) {
                  await launchUrl(
                    githubUrl,
                    mode: LaunchMode.externalApplication,
                  );
                }
              },
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset('assets/github.png', height: 20),
                  ),
                  const SizedBox(width: SSizes.spaceBtwMenu),
                  const Text('Github'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
