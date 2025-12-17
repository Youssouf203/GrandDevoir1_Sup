import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String _userKey = 'user';

  Future<bool> login(String username, String password) async {
    if (username == 'user' && password == '1234') {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_userKey, username);
      return true;
    }
    return false;
  }

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_userKey);
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
  }
}
