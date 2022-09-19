import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/asset.dart';
import 'package:instagram_clone/data/data.dart';
import 'package:instagram_clone/navigator.dart';

import 'pages.dart';

class NavPage extends StatefulWidget {
  const NavPage({Key? key}) : super(key: key);

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  List<Widget> pages = const [
    HomePage(
      key: PageStorageKey('HomePage'),
    ),
    ExplorePage(
      key: PageStorageKey('ExplorePage'),
    ),
    NewPostPage(
      key: PageStorageKey('NewPostPage'),
    ),
    NotificationPage(
      key: PageStorageKey('NotificationPage'),
    ),
    ProfilePage(
      key: PageStorageKey('ProfilePage'),
    ),
  ];
  int _currentScreenIndex = 0;
  int previousLastIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _currentScreenIndex == 2 ? null : pages[_currentScreenIndex],
      bottomNavigationBar: Container(
        height: 60.0,
        decoration: const BoxDecoration(
          color: Color(0xff272B40),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          ),
          child: _getBottomNavigationBar(),
        ),
      ),
    );
  }

  BottomNavigationBar _getBottomNavigationBar() {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: const Color(0xff272B40),
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            Asset.homeIcon,
            color: _currentScreenIndex == 0 ? pink : white,
          ),
          label: 'home',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            Asset.exploreIcon,
            color: _currentScreenIndex == 1 ? pink : white,
          ),
          label: 'explore',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            Asset.newPostIcon,
            color: _currentScreenIndex == 2 ? pink : white,
          ),
          label: 'newPost',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            Asset.notificationIcon,
            color: _currentScreenIndex == 3 ? pink : white,
          ),
          label: 'notifications',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            Asset.followerImage6,
            height: 30.0,
            width: 30.0,
          ),
          label: 'profile',
        ),
      ],
      currentIndex: _currentScreenIndex,
      onTap: (value) {
        setState(
          () {
            _currentScreenIndex = value;
            if (value == 2) {
              navigator(
                  context: context,
                  destinationPage: const NewPostPage(),
                  isPush: true);
              _currentScreenIndex = previousLastIndex;
            } else {
              previousLastIndex = value;
            }
          },
        );
      },
    );
  }
}
