import 'package:bmi_calc/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Dana'),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
