import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'صفحه فراموشی رمز عبور',
        ),
        backgroundColor: Colors.blue,
      ),
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return Center(
      child: Text('forgot password'),
    );
  }
}
