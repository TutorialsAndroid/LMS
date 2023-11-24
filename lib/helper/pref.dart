import 'package:shared_preferences/shared_preferences.dart';

class Pref {
  // Private constructor to prevent multiple instances
  Pref._privateConstructor();

  // Singleton instance
  static final Pref _instance = Pref._privateConstructor();

  // Getter for the instance
  factory Pref() {
    return _instance;
  }

  Future<void> saveBooleanValue(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  Future<bool?> getBooleanValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  Future<void> saveStringValue(String key, String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(key, value);
  }

  Future<String?> getStringValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  // Method to remove a value associated with a key
  Future<void> removePref(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}