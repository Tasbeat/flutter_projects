import 'package:flutter/material.dart';

void main() {
  var application = Application();
  runApp(application);
}

Widget getApplication() {
  return MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.pink,
      body: SafeArea(
        child: Center(child: Text('hello world!')),
      ),
    ),
  );
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return getApplication();
  }
}
