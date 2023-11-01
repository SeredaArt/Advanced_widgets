import 'package:advanced_widgets/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AppThemeProvider extends InheritedWidget {
  const AppThemeProvider({
    required this.theme,
    required Widget child,
    Key? key,
  }) : super(key: key, child: child);

  final AppTheme theme;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static AppThemeProvider of(BuildContext context) {
    final themeProvider =
    context.dependOnInheritedWidgetOfExactType<AppThemeProvider>();
    if (themeProvider == null) {
      throw StateError('AppThemeProvider are not provided in the widget tree');
    }

    return themeProvider;
  }
}