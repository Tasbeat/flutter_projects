import 'package:bmi_calc/constants/colors.dart';
import 'package:flutter/material.dart';

class LeftProgressBar extends StatelessWidget {
  final width;
  final height;
  const LeftProgressBar({Key? key, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: green,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(15.0),
            ),
          ),
        )
      ],
    );
  }
}
