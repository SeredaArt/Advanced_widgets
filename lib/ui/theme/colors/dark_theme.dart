import 'package:advanced_widgets/ui/theme/colors/appcolors.dart';
import 'package:flutter/material.dart';

class DarkTheme implements AppColorTheme {

  @override
  Brightness get brightness => Brightness.dark;

  @override
  Color get background => const Color(0xFF1b1b1b);

  @override
  Color get cloud => const Color(0xFFCACACA);

  @override
  Color get drops => const Color(0xFF00A5FF);

  @override
  Color get darkCloud => const Color(0xFF717070);

  @override
  Color get sun => const Color(0xFFFFE769);

  @override
  Color get textFieldColor => Colors.white;

  @override
  Color get slider => Colors.white70;

}