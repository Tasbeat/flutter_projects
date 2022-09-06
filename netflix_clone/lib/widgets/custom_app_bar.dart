import 'package:flutter/material.dart';
import 'package:netflix_clone/widgets/widgets.dart';

import '../assets.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffset;
  const CustomAppBar({Key? key, this.scrollOffset = 0.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color:
          Colors.black.withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
      child: Responsive(
        desktop: const _DesktopAppBar(),
        mobile: const _MobileAppBar(),
      ),
    );
  }
}

class _MobileAppBar extends StatelessWidget {
  const _MobileAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          const SizedBox(width: 10.0),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Image(
              image: AssetImage(Assets.netflixLogo0),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                _AppBarButtonsTitles(titleString: 'TV Shows'),
                _AppBarButtonsTitles(titleString: 'Movies'),
                _AppBarButtonsTitles(titleString: 'My List'),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _DesktopAppBar extends StatelessWidget {
  const _DesktopAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          const SizedBox(width: 10.0),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Image(
              image: AssetImage(Assets.netflixLogo1),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                _AppBarButtonsTitles(titleString: 'Home'),
                _AppBarButtonsTitles(titleString: 'TV Shows'),
                _AppBarButtonsTitles(titleString: 'Movies'),
                _AppBarButtonsTitles(titleString: 'Latest'),
                _AppBarButtonsTitles(titleString: 'My List'),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _AppBarButtonsTitles extends StatelessWidget {
  final String titleString;
  const _AppBarButtonsTitles({Key? key, required this.titleString})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print('clicked'),
      child: Text(
        titleString,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
