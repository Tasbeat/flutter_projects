import 'package:aslefoolad/asset.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffset;
  const CustomAppBar({Key? key, this.scrollOffset = 0.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print('App Bar Logo'),
      child: Container(
        color: const Color(0xff0053a3)
            .withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
        child: Row(
          children: const [
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Image(
                image: AssetImage(Asset.aslefooladLogo),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
