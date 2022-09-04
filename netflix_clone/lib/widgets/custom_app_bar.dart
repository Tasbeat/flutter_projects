import 'package:flutter/material.dart';

import '../assets.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffset;
  const CustomAppBar({Key? key, this.scrollOffset = 0.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color:
          Colors.black.withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
      child: SafeArea(
        child: Row(children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Image(
              image: AssetImage(Assets.netflixLogo0),
            ),
          )
        ]),
      ),
    );
  }
}
