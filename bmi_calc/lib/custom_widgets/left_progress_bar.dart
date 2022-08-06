import 'package:flutter/material.dart';

class LeftProgressBar extends StatelessWidget {
  final width;
  final height;
  const LeftProgressBar({Key? key , this.height , this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(15.0),
            ),
          ),
        )
      ],
    );
  }
}
