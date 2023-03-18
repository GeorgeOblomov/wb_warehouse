import 'package:enum_to_string/enum_to_string.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:surf_logger/surf_logger.dart';

enum PreferencesKey {
  theme,
  locale,
  supportedLocales,
}

class PreferencesProvider {
  bool _initialized = false;
  late final SharedPreferences _preferences;

  Future<void> initPreferencesIfNeeded() async {
    if (_initialized) {
      return;
    }
    _preferences = await SharedPreferences.getInstance();
    _initialized = true;
  }

  Future<bool> set(PreferencesKey key, Object? value) async {
    await initPreferencesIfNeeded();

    bool result;
    final strKey = EnumToString.convertToString(key);

    if (value is String) {
      result = await _preferences.setString(strKey, value);
    } else if (value is int) {
      result = await _preferences.setInt(strKey, value);
    } else if (value is bool) {
      result = await _preferences.setBool(strKey, value);
    } else if (value is List<String>) {
      result = await _preferences.setStringList(strKey, value);
    } else {
      Logger.d('Unexpected value type for the key $strKey, casting to String');
      result = await _preferences.setString(strKey, value.toString());
    }

    return result;
  }

  Future<T?> get<T>(PreferencesKey key, [T? defaultValue]) async {
    await initPreferencesIfNeeded();

    final strKey = EnumToString.convertToString(key);
    dynamic result;

    if (_preferences.containsKey(strKey)) {
      result = _preferences.get(strKey);
    }

    return result ?? defaultValue;
  }
}
