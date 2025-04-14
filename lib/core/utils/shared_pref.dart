import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setUserId(int id) async {
    await _prefs.setInt('user_id', id);
  }

  static int? getUserId() {
    return _prefs.getInt('user_id');
  }

  // Save auth token
  static Future<void> setToken(String token) async {
    await _prefs.setString('auth_token', token);
  }

  // Get auth token
  static String? getToken() {
    return _prefs.getString('auth_token');
  }

  static Future<void> clearAll() async {
    await _prefs.clear();
  }

  static bool isInitialized() {
    return _prefs != null;
  }
}
