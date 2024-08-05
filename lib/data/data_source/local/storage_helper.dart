import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class StorageHelper {
  static SharedPreferences? _prefs;

  static Future getInstance() async =>
      _prefs = await SharedPreferences.getInstance();

  static Future<String?> get(String key) async {
    await getInstance();
    return _prefs!.getString(key);
  }

  static Future set(String key, dynamic value) async {
    await getInstance();

    _prefs!.setString(key, value);
  }

  static void remove(String key) async {
    await getInstance();
    _prefs!.remove(key);
  }

  static void clear() async {
    await getInstance();
    _prefs!.clear();
  }
}
