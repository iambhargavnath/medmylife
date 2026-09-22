import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDataSource {
  static const _isLoggedInKey = 'is_logged_in';

  Future<void> saveLoginState() async {
    final preferences =
    await SharedPreferences.getInstance();

    await preferences.setBool(
      _isLoggedInKey,
      true,
    );
  }

  Future<bool> isLoggedIn() async {
    final preferences =
    await SharedPreferences.getInstance();

    return preferences.getBool(
      _isLoggedInKey,
    ) ??
        false;
  }

  Future<void> clearLoginState() async {
    final preferences =
    await SharedPreferences.getInstance();

    await preferences.remove(
      _isLoggedInKey,
    );
  }
}