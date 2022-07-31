import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: _getHomeScreenBar(),
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
            SizedBox(width: double.infinity, height: 40.0),
            Text(
              'خوش آمدید!',
              textDirection: TextDirection.rtl,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            SizedBox(height: 10.0),
            Image(
              image: AssetImage('images/welcome.png'),
              height: 300.0,
            ),
            _getSignUpButton(),
            _getSignInButton(),
          ],
        ),
      ),
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

  Widget _getSignInButton() {
    return TextButton(
      style: TextButton.styleFrom(
        minimumSize: Size(200.0, 40.0),
        primary: Colors.black,
        backgroundColor: Colors.white,
      ),
      child: Text(
        'ورود',
        style: TextStyle(fontSize: 16.0),
      ),
      onPressed: () {},
    );
  }

  PreferredSizeWidget _getHomeScreenBar() {
    return AppBar(
      elevation: 10.0,
      title: Text(
        'Home Screen',
      ),
    );
  }
}
