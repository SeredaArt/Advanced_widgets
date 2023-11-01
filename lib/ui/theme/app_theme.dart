import 'package:flutter/material.dart';
import 'colors/appcolors.dart';
import 'colors/dark_theme.dart';
import 'colors/light_theme.dart';



class AppTheme {
  const AppTheme({
    required this.colors,
    required this.themeMode,
  });

  factory AppTheme.light() => AppTheme(
        colors: LightTheme(),
        themeMode: ThemeMode.light,
      );
  factory AppTheme.dark() => AppTheme(
        colors: DarkTheme(),
        themeMode: ThemeMode.dark,
      );

  final AppColorTheme colors;
  final ThemeMode themeMode;
}
