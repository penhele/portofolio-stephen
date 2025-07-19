import 'package:flutter/material.dart';

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
                              title: 'Palindrome App',
                              description:
                                  'Aplikasi ini merupakan aplikasi Flutter yang memiliki fitur utama untuk mengecek apakah sebuah kata atau kalimat merupakan palindrom. Selain itu, aplikasi ini juga dilengkapi dengan fitur untuk mengambil nama dari API publik serta fitur penggantian bahasa (multi-language) yang memungkinkan pengguna memilih bahasa sesuai preferensi. Untuk mendukung fungsionalitas dan tampilan aplikasi, digunakan beberapa library populer Flutter seperti get (versi 4.7.2) untuk manajemen state dan navigasi, provider (versi 6.1.5) untuk pengelolaan state berbasis data, serta shared_preferences (versi 2.5.3) untuk menyimpan preferensi pengguna secara lokal, seperti status bahasa. Aplikasi ini juga menggunakan flutter_switch (versi 0.3.2) sebagai switch kustom, iconsax (versi 0.0.8) untuk ikon-ikon modern, lottie (versi 3.3.1) untuk menampilkan animasi menarik, dan awesome_dialog (versi 3.2.1) untuk menampilkan dialog interaktif yang user-friendly. Dengan kombinasi fitur dan library tersebut, aplikasi ini dirancang agar interaktif, informatif, dan mudah digunakan.',
                              githubUrl:
                                  'https://github.com/penhele/palindrome_app',
                              thumbnail: SImages.palindromeApp,
                            ),
                          ),
                          SizedBox(
                            width: constraints.maxWidth / columnCount - 20,
                            child: const ProjectCard(
                              title: 'Math App',
                              description:
                                  'Math App adalah proyek penulisan ilmiah',
                              githubUrl:
                                  'https://github.com/penhele/math-application',
                              thumbnail: SImages.mathApp,
                            ),
                          ),
                          SizedBox(
                            width: constraints.maxWidth / columnCount - 20,
                            child: const ProjectCard(
                              title: 'Story App',
                              description:
                                  'Story App adalah aplikasi mobile yang memungkinkan pengguna untuk mengunggah dan melihat foto melalui koneksi ke API publik. Aplikasi ini mengusung konsep mirip Instagram dengan penambahan beberapa fitur fungsional lainnya.',
                              githubUrl:
                                  'https://github.com/penhele/math-application',
                              youtubebUrl:
                                  'https://youtube.com/shorts/tYRpsubjlXc',
                              thumbnail: SImages.storyApp,
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
