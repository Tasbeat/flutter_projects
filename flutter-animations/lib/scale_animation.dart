import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ScaleAnimation extends StatefulWidget {
  const ScaleAnimation({super.key});

  @override
  State<ScaleAnimation> createState() => _ScaleAnimationState();
}

class _ScaleAnimationState extends State<ScaleAnimation> {
  double scale = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: AnimatedScale(
        duration: Duration(seconds: 1),
        scale: scale,
        child: GestureDetector(
          onTap: () {
            setState(() {
              setState(() {
                scale += 0.5;
              });
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
