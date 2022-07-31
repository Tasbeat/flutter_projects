import 'package:flutter/material.dart';

import 'login_page.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'vazir'),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getSecondScreenBar(),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return SafeArea(
      child: Center(
        child: TextButton(
          onPressed: () {
            Navigator.of(context).pop(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return LoginPage();
                },
              ),
            );
          },
          child: Text('Go to first page'),
        ),
      ),
    );
  }

  PreferredSizeWidget _getSecondScreenBar() {
    return AppBar(
      elevation: 10.0,
      backgroundColor: Colors.amber,
      title: Text(
        'Second Screen',
      ),
    );
  }
}
