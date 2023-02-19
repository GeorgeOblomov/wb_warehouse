import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LocaleProvider with ChangeNotifier {
  Locale? locale;

  LocaleProvider();

  void setLocale(Locale newLocale) {
    if (AppLocalizations.supportedLocales.contains(newLocale)) return;
    locale = newLocale;
    notifyListeners();
  }
}
