import 'package:flutter/material.dart';
import 'package:monews_app/data/data.dart';

class LabelContent extends StatelessWidget {
  const LabelContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10.0),
      width: 76.0,
      height: 36.0,
      decoration: BoxDecoration(
        color: pink2,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: const Center(
        child: Text(
          'فوتبال اروپا',
          style: TextStyle(
            color: pink,
            fontFamily: 'SM',
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
