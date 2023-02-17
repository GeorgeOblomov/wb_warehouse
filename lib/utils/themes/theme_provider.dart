import 'package:flutter/material.dart';
import 'package:wb_warehouse/utils/themes/app_theme/base_theme.dart';
import 'package:wb_warehouse/utils/themes/app_theme/dark_theme.dart';
import 'package:wb_warehouse/utils/themes/app_theme/light_theme.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isLight = true;

  BaseTheme get appTheme => _isLight ? LightTheme() : DarkTheme();

  void setTheme({required bool isLight}) {
    _isLight = isLight;
  }

  bool get isLightTheme => _isLight;
}
