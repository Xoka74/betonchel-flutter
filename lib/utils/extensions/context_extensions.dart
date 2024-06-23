import 'package:betonchel_manager/presentation/res/app_themes.dart';
import 'package:betonchel_manager/presentation/res/colors/app_colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:responsive_framework/responsive_framework.dart';

extension ContextExtensions on BuildContext {
  AppLocalizations get strings => AppLocalizations.of(this);

  ResponsiveBreakpointsData get screen => ResponsiveBreakpoints.of(this);

  ThemeData get theme => Theme.of(this);

  AppColorsTheme get colorsTheme => AppColorsTheme.of(this) ?? AppThemes.lightColors;
}
