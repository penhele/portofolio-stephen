import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/constants/sizes.dart';

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
      height: 500,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://www.salamyogyakarta.com/wp-content/uploads/untitled.jpg',
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: SSizes.spaceBtwItems),
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            Expanded(child: Text(description, textAlign: TextAlign.justify)),
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
