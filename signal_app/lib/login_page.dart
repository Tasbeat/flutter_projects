import 'package:flutter/material.dart';
import 'package:signal_app/blog_page.dart';
import 'package:signal_app/forgot_password_page.dart';
import 'package:signal_app/navigator.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _getLoginPageBar(),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40.0),
            _getWelcomeText(),
            SizedBox(height: 15.0),
            Image(
              image: AssetImage('images/w.png'),
              height: 300.0,
            ),
            _getSignUpButton(),
            SizedBox(height: 10.0),
            _getSignInButton(context),
            _ForgotPasswordButton(context),
          ],
        ),
      ),
    );
  }

  Widget _getWelcomeText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'خوش آمدید!',
          textDirection: TextDirection.rtl,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        SizedBox(width: 5.0),
        Icon(
          Icons.login,
          color: Colors.black,
          size: 20.0,
        )
      ],
    );
  }

  Widget _ForgotPasswordButton(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: Colors.black,
      ),
      onPressed: () {
        navigator(
          context,
          ForgotPasswordPage(),
        );
      },
      child: Text('فراموشی رمز عبور!', textDirection: TextDirection.rtl),
    );
  }

  Widget _getSignUpButton() {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          minimumSize: Size(200.0, 40.0),
          side: BorderSide(color: Colors.black, width: 2.0),
          primary: Colors.black),
      onPressed: () {},
      child: Text(
        'ثبت نام',
        style: TextStyle(fontSize: 16.0),
      ),
    );
  }

  Widget _getSignInButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(200.0, 40.0),
        primary: Colors.black,
        elevation: 10.0,
      ),
      child: Text(
        'ورود',
        style: TextStyle(fontSize: 16.0),
      ),
      onPressed: () {
        navigator(
          context,
          BlogPage(),
        );
      },
    );
  }

  PreferredSizeWidget _getLoginPageBar() {
    return AppBar(
      elevation: 10.0,
      title: Text(
        'Home Screen',
      ),
    );
  }
}
