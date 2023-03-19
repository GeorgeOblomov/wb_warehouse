import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:wb_warehouse/data_management/common/preferences_provider.dart';

class LocaleProvider with ChangeNotifier {
  Locale? locale;
  final PreferencesProvider _preferencesProvider;

  LocaleProvider(this._preferencesProvider, String initialLocaleCode) {
    _setInitialLocale(initialLocaleCode);
  }

  Future<void> setLocale(Locale newLocale) async {
    if (!AppLocalizations.supportedLocales.contains(newLocale)) return;
    await _preferencesProvider.set(PreferencesKey.theme, newLocale.languageCode);
    locale = newLocale;
    notifyListeners();
  }

  void _setInitialLocale(String initialLocaleCode) {
    final localeCode = EnumToString.fromString(LocaleCode.values, initialLocaleCode);
    switch (localeCode) {
      case LocaleCode.en:
        locale = Locale(initialLocaleCode);
        break;
      case LocaleCode.ru:
        locale = Locale(initialLocaleCode);
        break;
      default:
        locale = const Locale('en');
        break;
    }
  }
}

enum LocaleCode {
  en,
  ru,
}
