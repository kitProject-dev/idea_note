import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class SettingRepository {
  SharedPreferences _sharedPreferences;

  Future<void> initialize() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
  }

  Future<bool> setValue(String key, Object value) async {
    if (_sharedPreferences == null) {
      await initialize();
    }
    switch (value.runtimeType) {
      case bool:
        return _sharedPreferences.setBool(key, value as bool);
      case int:
        return _sharedPreferences.setInt(key, value as int);
      case double:
        return _sharedPreferences.setDouble(key, value as double);
      case String:
        return _sharedPreferences.setString(key, value as String);
      default:
        if (value is List<String>) {
          return _sharedPreferences.setStringList(key, value);
        }
        return false;
    }
  }

  Object getValue(String key) {
    if (_sharedPreferences == null) {
      throw StateError('Not initialize setting');
    }
    return _sharedPreferences.get(key);
  }

  void dispose() {}
}
