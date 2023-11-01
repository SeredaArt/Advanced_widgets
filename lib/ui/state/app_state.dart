import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../theme/app_theme.dart';

final appStateProvider = ChangeNotifierProvider<AppStateNotifier>(
      (ref) => AppStateNotifier(),
);

//
class AppStateNotifier extends ChangeNotifier {
  AppTheme theme = AppTheme.dark();
  double scaleWeather = 1.0;
  double currentSliderValue = 0.5;


  Future<void> toogleTheme() async {
    theme =
    theme.themeMode == ThemeMode.dark ? AppTheme.light() : AppTheme.dark();
    notifyListeners();
  }

  void setValue(value) {
    currentSliderValue = value;
    notifyListeners();
  }

  void changeScale() {
    scaleWeather
    = scaleWeather == 1.0 ? scaleWeather = 3.0 : scaleWeather = 1.0;
    notifyListeners();
  }

}