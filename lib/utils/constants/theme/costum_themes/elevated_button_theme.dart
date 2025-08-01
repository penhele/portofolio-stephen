import 'package:flutter/material.dart';

import '../../colors.dart';

class SElevatedButtonTheme {
  SElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: SColors.white,
      backgroundColor: SColors.primary,
      textStyle: const TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: SColors.white,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: SColors.white,
      backgroundColor: SColors.primary,
      textStyle: const TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: SColors.white,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}
