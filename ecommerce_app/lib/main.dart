import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/ui/pages/home_page.dart';
import 'package:ecommerce_app/ui/pages/login_page.dart';
import 'package:ecommerce_app/ui/pages/nav_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      theme: ThemeData(
        textTheme: const TextTheme(
          headline1: TextStyle(
            color: Colors.black,
            fontFamily: 'SB',
            fontSize: 14.0,
          ),
          headline2: TextStyle(
            color: CustomColors.grey,
            fontFamily: 'SB',
            fontSize: 12.0,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}
