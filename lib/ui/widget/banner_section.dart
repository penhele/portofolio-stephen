import 'package:flutter/material.dart';

import '../../model/project_list.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/project_utils.dart';

class BannerSection extends StatelessWidget {
  const BannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                style: Theme.of(
                  context,
                ).textTheme.headlineSmall!.copyWith(color: SColors.white),
              ),
              const SizedBox(height: SSizes.spaceBtwMenu),

              Text(
                projectList.length.toString(),
                style: Theme.of(
                  context,
                ).textTheme.headlineLarge!.copyWith(color: SColors.white),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                'Most Used Languages',
                style: Theme.of(
                  context,
                ).textTheme.headlineSmall!.copyWith(color: SColors.white),
              ),
              const SizedBox(height: SSizes.spaceBtwMenu),

              Row(
                children: getMostUsedLanguages(projectList).entries
                    .take(3)
                    .map(
                      (entry) => Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 1,
                          horizontal: 8,
                        ),
                        child: Image.asset(entry.key, height: 32, width: 32),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
