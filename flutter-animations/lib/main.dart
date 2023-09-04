import 'package:animations/opacity_animation.dart';
import 'package:animations/position_animation.dart';
import 'package:animations/rotation_animation.dart';
import 'package:animations/scale_animation.dart';
import 'package:animations/switch.dart';
import 'package:animations/text_animation.dart';
import 'package:flutter/material.dart';

import 'container_animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimationSwitch(),
    );
  }
}
