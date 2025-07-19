import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/constants/sizes.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.url,
    required this.label,
    required this.iconPath,
  });

  final String url;
  final String label;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final Uri uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(iconPath, height: 20),
          const SizedBox(width: SSizes.spaceBtwMenu),
          Text(label),
        ],
      ),
    );
  }
}
