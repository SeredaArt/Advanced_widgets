import 'package:flutter/material.dart';

abstract class AppColorTheme {
  Brightness get brightness;

  Color get textFieldColor;

  Color get background;
  Color get sun;
  Color get cloud;
  Color get darkCloud;
  Color get drops;
  Color get slider;
}