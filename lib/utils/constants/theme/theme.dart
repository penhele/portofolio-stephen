import 'package:flutter/material.dart';

import 'costum_themes/elevated_button_theme.dart';
import 'costum_themes/text_theme.dart';

class SAppTheme {
  SAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    elevatedButtonTheme: SElevatedButtonTheme.lightElevatedButtonTheme,
    textTheme: STextTheme.lightTextTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.dark,
    elevatedButtonTheme: SElevatedButtonTheme.darkElevatedButtonTheme,
    textTheme: STextTheme.darkTextTheme,
  );
}
