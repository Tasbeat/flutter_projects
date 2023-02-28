import 'package:ecommerce_app/data/repository/authentication_repository.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: ElevatedButton(
          onPressed: () async {
            var either = await AuthenticationRepository()
                .login('tasbeat100', '12345678');
            either.fold((l) => print(l), (r) => print(r));
          },
          child: Text('click'),
        ),
      )),
    );
  }
}
