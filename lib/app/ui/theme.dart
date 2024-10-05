import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {
  const AppTheme._();
  static final ColorScheme _colorSchemeLight = ColorScheme.light(
    primary: AppColors.primary,
  );

  static const TextTheme _textTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 70,
      color: Colors.black,
      fontWeight: FontWeight.w400,
    ),
    labelLarge: TextStyle(
      fontSize: 18,
      color: Colors.black,
      fontWeight: FontWeight.normal,
    ),
    bodyMedium: TextStyle(
      fontSize: 12,
      color: Colors.black,
      fontWeight: FontWeight.normal,
    ),
    bodySmall: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.normal,
    ),
    bodyLarge: TextStyle(
      color: Colors.black,
    ),
    titleLarge: TextStyle(
      color: Colors.black,
    ),
  );

  static final _dividerThemeData = DividerThemeData(
    color: AppColors.lightGrey.withOpacity(0.4),
  );

  static final _inputDecorationTheme = InputDecorationTheme(
    labelStyle: TextStyle(
      color: _colorSchemeLight.primary,
      fontWeight: FontWeight.normal,
      fontSize: 14,
    ),
    border: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.lightGrey,
      ),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.lightGrey,
      ),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.lightGrey,
      ),
    ),
  );

  static final _elevatedButtonTheme = ElevatedButton.styleFrom(
    elevation: 0,
    foregroundColor: Colors.white,
    backgroundColor: _colorSchemeLight.primary,
    textStyle: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 16,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12), // <-- Radius
    ),
    padding: const EdgeInsets.symmetric(
      vertical: 16,
      horizontal: 32,
    ),
  );

  static final _elevatedButtonThemeData = ElevatedButtonThemeData(
    style: _elevatedButtonTheme,
  );

  static ThemeData get light {
    return ThemeData.from(
      colorScheme: _colorSchemeLight,
      textTheme: _textTheme,
      useMaterial3: true,
    ).copyWith(
      elevatedButtonTheme: _elevatedButtonThemeData,
      inputDecorationTheme: _inputDecorationTheme,
      dividerTheme: _dividerThemeData,
    );
  }
}
