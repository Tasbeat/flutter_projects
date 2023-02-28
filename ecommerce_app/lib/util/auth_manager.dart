import 'package:ecommerce_app/di/di.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthManager {
  static final SharedPreferences sharedPref = locator.get();
  static saveToken(String token) {
    sharedPref.setString('access_token', token);
  }

  static logout() {
    sharedPref.clear();
  }
}
