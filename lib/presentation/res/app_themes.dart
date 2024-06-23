import 'package:betonchel_manager/presentation/res/colors/app_colors.dart';
import 'package:betonchel_manager/presentation/res/colors/app_colors_theme.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData light = ThemeData.light(useMaterial3: false).copyWith(
    primaryColor: AppColors.blue,
    colorScheme: const ColorScheme.light(),
    extensions: [
      lightColors,
    ],
  );

  static final AppColorsTheme lightColors = AppColorsTheme(
    backgroundPrimary: AppColors.blue,
    textPrimary: AppColors.darkBlue,
  );

// static final TypographyTheme lightTypography = TypographyTheme(
//   textColor: AppColors.black900,
// );
}
