import 'package:shared_preferences/shared_preferences.dart';

sealed class LocalStorage {
  static late SharedPreferences _sharedPreferences;

  static Future<void> initLocalStorage() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<void> storeStringValue(
          {required String key, required String value}) async =>
      await _sharedPreferences.setString(key, value);

  static Future<String> getStringValue(
          {required String key}) async =>
      _sharedPreferences.getString(key) ?? "";
}
