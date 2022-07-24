import 'package:flutter/material.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getApplication();
  }
}

Widget getApplication() {
  return MaterialApp(
    theme: ThemeData(fontFamily: 'vazir'),
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: getAppBar(),
      body: SafeArea(
        child: Text('علی علیرحیمی'),
      ),
    ),
  );
}

PreferredSizeWidget getAppBar() {
  return AppBar(
    backgroundColor: Colors.blue,
    elevation: 0,
    title: Text('رزومه'),
  );
}
