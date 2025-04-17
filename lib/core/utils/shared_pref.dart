import 'package:benta/Features/Auth/data/models/sign_in_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  static late SharedPreferences _prefs;

  /// Call this once before using any prefs method (usually in main)
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setUserId(int id) async {
    await _prefs.setInt('user_id', id);
  }

  static int? getUserId() {
    return _prefs.getInt('user_id');
  }

  static Future<void> setToken(String token) async {
    await _prefs.setString('auth_token', token);
  }

  static String? getToken() {
    return _prefs.getString('auth_token');
  }

  static Future<void> clearAll() async {
    await _prefs.clear();
  }

  static bool isInitialized() {
    return _prefs != null;
  }

  Future<void> saveUserData(UserSignInModel user) async {
    await setUserId(user.user.id);
    await setToken(user.token);
  }

  static Future<void> setFirstTime(bool value) async {
    await _prefs.setBool('is_first_time', value);
  }

  static bool isFirstTime() {
    return _prefs.getBool('is_first_time') ?? true;
  }

  static List<String> getFavoriteItems() {
    final items = _prefs.getStringList('favorite_items');
    return items ?? [];
  }

  /// Save the full list
  static Future<void> saveFavoriteItems(List<String> items) async {
    await _prefs.setStringList('favorite_items', items);
    print("💾 Saved to prefs: $items");
  }

  /// Add item if it's not already in list
  static Future<void> addFavoriteItem(String itemId) async {
    final favorites = getFavoriteItems();
    if (!favorites.contains(itemId)) {
      favorites.add(itemId);
      await saveFavoriteItems(favorites);
    }
  }

  /// Remove item if exists
  static Future<void> removeFavoriteItem(String itemId) async {
    final favorites = getFavoriteItems();
    if (favorites.contains(itemId)) {
      favorites.remove(itemId);
      await saveFavoriteItems(favorites);
    }
  }

  static bool isFavorite(String id) {
    final favs = getFavoriteItems();
    final result = favs.contains(id);
    return result;
  }
}
