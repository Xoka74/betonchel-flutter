import 'package:flutter/material.dart';

class AppColorsTheme extends ThemeExtension<AppColorsTheme> {
  final Color textPrimary;
  final Color backgroundPrimary;

  AppColorsTheme({
    required this.textPrimary,
    required this.backgroundPrimary,
  });

  @override
  ThemeExtension<AppColorsTheme> copyWith() => throw UnimplementedError();

  @override
  ThemeExtension<AppColorsTheme> lerp(covariant ThemeExtension<AppColorsTheme>? other, double t) => this;

  static AppColorsTheme? of(BuildContext context) => Theme.of(context).extension<AppColorsTheme>();
}
