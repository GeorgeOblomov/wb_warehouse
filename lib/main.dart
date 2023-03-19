import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:wb_warehouse/app/app.dart';
import 'package:wb_warehouse/data_management/common/preferences_provider.dart';
import 'package:wb_warehouse/utils/locale/locale_provider.dart';
import 'package:wb_warehouse/utils/themes/theme_provider.dart';

import 'data_management/common/data_manager.dart';
import 'data_management/common/network_client.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final preferences = PreferencesProvider();
  await preferences.initPreferencesIfNeeded();

  final initialThemeKey = await preferences.get(PreferencesKey.theme, 'light');
  final initialLocaleCode = await preferences.get(PreferencesKey.theme, 'en');

  List<SingleChildWidget> injectedDependencies() {
    return [
      Provider<DataManager>(create: (_) => DataManager(NetworkClient())),
      ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider(preferences, initialThemeKey!)),
      ChangeNotifierProvider<LocaleProvider>(create: (_) => LocaleProvider(preferences, initialLocaleCode!)),
    ];
  }

  runApp(
    MultiProvider(
      providers: injectedDependencies(),
      child: App(),
    ),
  );
}
