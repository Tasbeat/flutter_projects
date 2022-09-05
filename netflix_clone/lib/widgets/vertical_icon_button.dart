import 'package:flutter/material.dart';

class VerticalIconButton extends StatelessWidget {
  final IconData buttonIcon;
  final String text;
  final Color color;
  final Function() onTap;
  const VerticalIconButton(
      {Key? key,
      required this.buttonIcon,
      required this.text,
      required this.color,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            buttonIcon,
            size: 20.0,
            color: Colors.white,
          ),
          const SizedBox(height: 5.0),
          Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
