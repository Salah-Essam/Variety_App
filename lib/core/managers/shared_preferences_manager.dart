import 'package:shared_preferences/shared_preferences.dart';

const String _tokenKey = "token";
const String _guestKey = "guest";

class SharedPreferencesManager {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setToken({required String token}) async {
    await _prefs.setString(_tokenKey, token);
  }

  static String? getToken() {
    return _prefs.getString(_tokenKey);
  }

  static Future<bool> removeToken() async {
    return await _prefs.remove(_tokenKey);
  }

  static Future<void> setGuest({required bool isGuest}) async {
    await _prefs.setBool(_guestKey, isGuest);
  }

  static bool isGuest() {
    return _prefs.getBool(_guestKey) ?? false;
  }
}
