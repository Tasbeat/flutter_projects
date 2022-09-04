import 'package:flutter/material.dart';

import '../assets.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffset;
  const CustomAppBar({Key? key, this.scrollOffset = 0.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color:
          Colors.red.withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
      child: SafeArea(
        child: Row(
          children: [
            SizedBox(width: 10.0),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Image(
                image: AssetImage(Assets.netflixLogo0),
              ),
            ),
            _appBarButtonsTitles(titleString: 'TV Shows'),
            _appBarButtonsTitles(titleString: 'Movies'),
            _appBarButtonsTitles(titleString: 'My List'),
          ],
        ),
      ),
    );
  }
}

class _appBarButtonsTitles extends StatelessWidget {
  final String titleString;
  const _appBarButtonsTitles({Key? key, required this.titleString})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print('clicked'),
      child: Text(
        titleString,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
