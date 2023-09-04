import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class RotationAnimation extends StatefulWidget {
  const RotationAnimation({super.key});

  @override
  State<RotationAnimation> createState() => _RotationAnimationState();
}

class _RotationAnimationState extends State<RotationAnimation> {
  double turn = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: AnimatedRotation(
        curve: Curves.bounceIn,
        duration: Duration(seconds: 1),
        turns: turn,
        child: GestureDetector(
          onTap: () {
            setState(() {
              if (turn == 1) {
                turn = 2;
              } else {
                turn = 1;
              }
            });
          },
          child: SizedBox(
            height: 100,
            width: 100,
            child: Image.asset('images/khiyar.png'),
          ),
        ),
      ),
    ));
  }
}
