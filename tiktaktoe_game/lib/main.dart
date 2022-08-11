import 'package:flutter/material.dart';
import 'package:tiktaktoe_game/pages/home_page.dart';

void main() {
  runApp(
    TikTakToeGame(),
  );
}

class TikTakToeGame extends StatelessWidget {
  const TikTakToeGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
