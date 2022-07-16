import 'package:flutter/material.dart';

void main() {
  var application = Application();
  runApp(application);
}

Widget getApplication() {
  return MaterialApp(
    home: Scaffold(backgroundColor: Colors.green, body: getBody()),
  );
}

Widget getBody() {
  return SafeArea(
    child: Center(
      child: Image(
        image: AssetImage('images/flags.png'),
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
