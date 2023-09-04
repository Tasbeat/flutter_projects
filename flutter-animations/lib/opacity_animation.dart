import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class OpacityAnimation extends StatefulWidget {
  const OpacityAnimation({super.key});

  @override
  State<OpacityAnimation> createState() => _OpacityAnimationState();
}

class _OpacityAnimationState extends State<OpacityAnimation> {
  double opacity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              duration: Duration(seconds: 1),
              opacity: opacity,
              child: Container(
                height: 200,
                width: 200,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (opacity == 1) {
                      opacity = 0;
                    } else {
                      opacity = 1;
                    }
                  });
                },
                child: const Text('Click To Fade'))
          ],
        ),
      ),
    );
  }
}
