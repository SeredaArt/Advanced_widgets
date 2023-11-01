import 'package:advanced_widgets/ui/theme/colors/appcolors.dart';
import 'package:flutter/material.dart';

class LightTheme implements AppColorTheme {

  @override
  Brightness get brightness => Brightness.light;

  @override
  Color get background => const Color(0xFFF5F5F5);

  @override
  Color get cloud => const Color(0xFFC4C4C4);

  @override
  Color get drops => const Color(0xFF007FC2);

  @override
  Color get darkCloud => const Color(0xFF343434);

  @override
  Color get sun => const Color(0xFFFCDD3D);

  @override
  Color get textFieldColor => Colors.black;

  @override
  Color get slider => ThemeData.light().colorScheme.primary;

}