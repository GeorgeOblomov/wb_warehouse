import 'package:flutter/material.dart';
import 'package:wb_warehouse/data_management/common/preferences_provider.dart';
import 'package:wb_warehouse/utils/themes/app_theme/base_theme.dart';
import 'package:wb_warehouse/utils/themes/app_theme/dark_theme.dart';
import 'package:wb_warehouse/utils/themes/app_theme/light_theme.dart';

class ThemeProvider extends ChangeNotifier {
  final PreferencesProvider _preferencesProvider;

  bool _isLight = true;

  ThemeProvider(this._preferencesProvider);

  BaseTheme get appTheme => _isLight ? LightTheme() : DarkTheme();

  void setTheme({required bool isLight}) {
    _isLight = isLight;
    notifyListeners();
  }

  bool get isLightTheme => _isLight;
}
