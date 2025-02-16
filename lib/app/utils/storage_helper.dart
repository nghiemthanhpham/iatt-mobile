import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class StorageHelper {
  
  static final _prefs = SharedPreferences.getInstance();

  static Future<void> saveString(String key, String value) async {
    final prefs = await _prefs;
    await prefs.setString(key, value);
  }

  static Future<String?> getString(String key) async {
    final prefs = await _prefs;
    return prefs.getString(key);
  }

  static Future<void> saveObject(String key, Map<String, dynamic> value) async {
    final prefs = await _prefs;
    await prefs.setString(key, jsonEncode(value));
  }

  static Future<Map<String, dynamic>?> getObject(String key) async {
    final prefs = await _prefs;
    final value = prefs.getString(key);
    return value != null ? jsonDecode(value) : null;
  }

  static Future<void> remove(String key) async {
    final prefs = await _prefs;
    await prefs.remove(key);
  }

  static Future<void> clear() async {
    final prefs = await _prefs;
    await prefs.clear();
  }
}
