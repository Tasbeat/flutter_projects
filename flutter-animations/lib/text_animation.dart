import 'package:flutter/material.dart';

class TextAnimation extends StatefulWidget {
  const TextAnimation({super.key});

  @override
  State<TextAnimation> createState() => _TextAnimationState();
}

class _TextAnimationState extends State<TextAnimation> {
  bool switchAnim = false;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: AnimatedDefaultTextStyle(
          duration: Duration(seconds: 1),
          style: TextStyle(
              fontSize: 100, fontWeight: FontWeight.bold, color: Colors.blue),
          child: Text(
            'AmirahmadAdibi',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
