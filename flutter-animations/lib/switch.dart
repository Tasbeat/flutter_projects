import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AnimationSwitch extends StatefulWidget {
  const AnimationSwitch({super.key});

  @override
  State<AnimationSwitch> createState() => _AnimationSwitchState();
}

class _AnimationSwitchState extends State<AnimationSwitch> {
  bool isSwitchTrue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            isSwitchTrue = !isSwitchTrue;
          });
        },
        child: Center(
          child: AnimatedSwitcher(
            duration: Duration(seconds: 1),
            child: (isSwitchTrue)
                ? Image(
                    key: Key('1'),
                    image: AssetImage('images/khiyar.png'),
                  )
                : Image(
                    key: Key('2'),
                    image: AssetImage('images/gozhe.png'),
                  ),
          ),
        ),
      ),
    );
  }
}
