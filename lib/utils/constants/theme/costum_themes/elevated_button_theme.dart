import 'package:flutter/material.dart';

import '../../colors.dart';

class SElevatedButtonTheme {
  SElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: SColors.white,
      backgroundColor: SColors.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}
