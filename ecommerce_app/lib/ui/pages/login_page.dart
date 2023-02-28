import 'package:ecommerce_app/data/repository/authentication_repository.dart';
import 'package:ecommerce_app/di/di.dart';
import 'package:ecommerce_app/util/auth_manager.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SharedPreferences sharedPref = locator.get();
    print(sharedPref.get('access_token'));

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                var either = await AuthenticationRepository()
                    .login('tasbeat', 'Alialirahimi12');
                var token = sharedPref.get('access_token');
                print(token);
              },
              child: Text('login'),
            ),
            ElevatedButton(
              onPressed: () async {
                AuthManager.logout();
                print('logged out');
              },
              child: Text('logout'),
            ),
          ],
        ),
      ),
    );
  }
}
