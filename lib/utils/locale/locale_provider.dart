import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:wb_warehouse/data_management/common/preferences_provider.dart';

class LocaleProvider with ChangeNotifier {
  Locale? locale;
  final PreferencesProvider _preferencesProvider;

  LocaleProvider(this._preferencesProvider);

  void setLocale(Locale newLocale) {
    if (AppLocalizations.supportedLocales.contains(newLocale)) return;
    locale = newLocale;
    notifyListeners();
  }
}
