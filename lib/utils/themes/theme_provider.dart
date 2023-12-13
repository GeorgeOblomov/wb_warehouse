import 'package:flutter/material.dart';
import 'package:wb_warehouse/data_management/common/preferences_provider.dart';
import 'package:wb_warehouse/utils/themes/app_theme/base_theme.dart';
import 'package:wb_warehouse/utils/themes/app_theme/dark_theme.dart';
import 'package:wb_warehouse/utils/themes/app_theme/light_theme.dart';

class ThemeProvider extends ChangeNotifier {
  final PreferencesProvider _preferencesProvider;

  bool _isLight = true;

  ThemeProvider(this._preferencesProvider, String initialThemeKey) {
    _setInitialTheme(initialThemeKey);
  }

  bool get isLightTheme => _isLight;

  BaseTheme get appTheme => _isLight ? LightTheme() : DarkTheme();

  Future<void> setTheme({required bool isLight}) async {
    await _preferencesProvider.set(PreferencesKey.theme, isLight ? 'light' : 'dark');
    _isLight = isLight;
    notifyListeners();
  }

  void _setInitialTheme(String initialThemeKey) {
    switch (initialThemeKey) {
      case 'light':
        _isLight = true;

        return;
      case 'dark':
        _isLight = false;

        return;
      default:
        _isLight = true;

        return;
    }
  }
}
