import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/constants/text_strings.dart';
import 'social_button.dart';

class ProfileText extends StatelessWidget {
  const ProfileText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            bool isMobile = constraints.maxWidth < 800;

            return isMobile
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText(
                        STexts.name,
                        style: Theme.of(context).textTheme.headlineMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: SSizes.spaceBtwItems),
                      SelectableText(
                        'Mobile Developer | Machine Learning',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: SColors.grey,
                        ),
                      ),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SelectableText(
                        STexts.name,
                        style: Theme.of(context).textTheme.headlineMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: SSizes.spaceBtwSection),
                      SelectableText(
                        'Mobile Developer | Machine Learning',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: SColors.grey,
                        ),
                      ),
                    ],
                  );
          },
        ),
        const SizedBox(height: SSizes.spaceBtwItems),

        SelectableText(
          STexts.description,
          textAlign: TextAlign.justify,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: SSizes.spaceBtwItems),

        const Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            SocialButton(
              url: 'https://github.com/penhele',
              label: STexts.github,
              iconPath: SImages.githubLogo,
            ),
            SocialButton(
              url: 'https://linkedin.com/in/stephenhelenus',
              label: STexts.linkedin,
              iconPath: SImages.linkedinLogo,
            ),
            SocialButton(
              url: 'https://instagram.com/stephenhelenus',
              label: STexts.instagram,
              iconPath: SImages.instagramLogo,
            ),
          ],
        ),
      ],
    );
  }
}
