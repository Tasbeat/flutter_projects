import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Text buttonText;
  final Function() onPressedFunction;
  final ButtonStyle buttonStyle;
  const CustomElevatedButton(
      {Key? key,
      required this.onPressedFunction,
      required this.buttonText,
      required this.buttonStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: buttonStyle, onPressed: onPressedFunction, child: buttonText);
  }
}
