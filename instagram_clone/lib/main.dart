import 'dart:math';

import 'package:flutter/material.dart';
import 'package:instagram_clone/data/data.dart';
import 'package:instagram_clone/pages/pages.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          headline1: TextStyle(
            color: white,
            fontFamily: 'GB',
            fontSize: 16.0,
          ),
          headline2: TextStyle(
            color: white,
            fontFamily: 'GS',
            fontSize: 10.0,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: pink,
            textStyle:
                const TextStyle(color: white, fontFamily: 'GB', fontSize: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
