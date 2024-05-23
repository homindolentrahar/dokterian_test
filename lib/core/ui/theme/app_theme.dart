import 'package:dokterian_test/generated/colors.gen.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static final lightTheme = ThemeData(
    fontFamily: "Poppins",
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: ColorName.primary,
      onPrimary: ColorName.background,
      secondary: ColorName.primaryAlt,
      onSecondary: ColorName.background,
      error: Colors.red,
      onError: Colors.white,
      background: ColorName.surface,
      onBackground: ColorName.text,
      surface: ColorName.background,
      onSurface: ColorName.textAlt,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: ColorName.text,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: TextStyle(
        color: ColorName.text,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}
