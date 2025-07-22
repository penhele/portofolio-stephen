import 'package:flutter/material.dart';

import '../../utils/constants/image_strings.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
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
