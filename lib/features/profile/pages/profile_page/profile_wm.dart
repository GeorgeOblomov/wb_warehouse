import 'dart:async';

import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wb_warehouse/features/profile/pages/profile_page/l10n/profile_l10n.dart';
import 'package:wb_warehouse/features/profile/pages/profile_page/navigation/profile_navigator.dart';
import 'package:wb_warehouse/features/profile/pages/profile_page/profile_model.dart';
import 'package:wb_warehouse/features/profile/pages/profile_page/profile_page.dart';
import 'package:wb_warehouse/utils/themes/theme_provider.dart';

// ignore_for_file: unused_field
class ProfileWm extends WidgetModel<ProfilePage, ProfileModel> {
  final ProfileL10n _l10n;
  final ProfileNavigator _navigator;

  final _themeController = StreamController<bool>();

  ProfileWm(
    this._l10n,
    this._navigator,
    super.model,
  );

  Stream<bool> get themeStream => _themeController.stream;

  String get themeItemTitle => _l10n.themeItemTitle;
  String get localeItemTitle => _l10n.localeItemTitle;

  Color get menuBorderColor => context.watch<ThemeProvider>().appTheme.menuBorderColor;

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _initThemeSwitcherValue();
  }

  @override
  void dispose() {
    _themeController.close();
    super.dispose();
  }

  void onThemeItemTap(bool isLight) {
    context.read<ThemeProvider>().setTheme(isLight: isLight);
    _themeController.add(isLight);
  }

  void onLocaleItemTap() {}

  void _initThemeSwitcherValue() {
    final isLightTheme = context.read<ThemeProvider>().isLightTheme;
    _themeController.add(isLightTheme);
  }
}
