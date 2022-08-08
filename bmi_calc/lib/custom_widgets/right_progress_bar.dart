import 'package:bmi_calc/constants/colors.dart';
import 'package:flutter/material.dart';

class RightProgressBar extends StatelessWidget {
  final width;
  final height;
  const RightProgressBar({Key? key, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: red,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
            ),
          ),
        )
      ],
    );
  }
}
