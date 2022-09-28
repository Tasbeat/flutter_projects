import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:monews_app/data/data.dart';
import 'package:monews_app/pages/pages.dart';

import '../asset.dart';

class NavPage extends StatefulWidget {
  const NavPage({Key? key}) : super(key: key);

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  List<Widget> pages = const [
    HomePage(),
    DiscoverPage(),
    AddNewsPage(),
    BookmarkPage(),
    ProfilePage(),
  ];
  int _currentScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages[_currentScreenIndex],
      bottomNavigationBar: Directionality(
        textDirection: TextDirection.rtl,
        child: buildMyNavBar(context),
      ),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Container(
                width: 38.0,
                height: 5.0,
                decoration: BoxDecoration(
                  color: _currentScreenIndex == 0 ? pink2 : transparent,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: _currentScreenIndex == 0 ? pink2 : transparent,
                      offset: const Offset(0.0, 5.0), //(x,y)
                      blurRadius: 5.0,
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _currentScreenIndex = 0;
                  });
                },
                icon: SvgPicture.asset(
                  Asset.homeIcon,
                  color: _currentScreenIndex == 0 ? pink : grey,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                width: 38.0,
                height: 5.0,
                decoration: BoxDecoration(
                  color: _currentScreenIndex == 1 ? pink2 : transparent,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: _currentScreenIndex == 1 ? pink2 : transparent,
                      offset: const Offset(0.0, 5.0), //(x,y)
                      blurRadius: 5.0,
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _currentScreenIndex = 1;
                  });
                },
                icon: SvgPicture.asset(
                  Asset.discoverIcon,
                  color: _currentScreenIndex == 1 ? pink : grey,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                width: 38.0,
                height: 5.0,
                decoration: BoxDecoration(
                  color: _currentScreenIndex == 2 ? pink2 : transparent,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: _currentScreenIndex == 2 ? pink2 : transparent,
                      offset: const Offset(0.0, 5.0), //(x,y)
                      blurRadius: 5.0,
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _currentScreenIndex = 2;
                  });
                },
                icon: SvgPicture.asset(
                  Asset.addIcon,
                  color: _currentScreenIndex == 2 ? pink : grey,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                width: 38.0,
                height: 5.0,
                decoration: BoxDecoration(
                  color: _currentScreenIndex == 3 ? pink2 : transparent,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: _currentScreenIndex == 3 ? pink2 : transparent,
                      offset: const Offset(0.0, 5.0), //(x,y)
                      blurRadius: 5.0,
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _currentScreenIndex = 3;
                  });
                },
                icon: SvgPicture.asset(
                  Asset.bookmarkIcon,
                  color: _currentScreenIndex == 3 ? pink : grey,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                width: 38.0,
                height: 5.0,
                decoration: BoxDecoration(
                  color: _currentScreenIndex == 4 ? pink2 : transparent,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: _currentScreenIndex == 4 ? pink2 : transparent,
                      offset: const Offset(0.0, 5.0), //(x,y)
                      blurRadius: 5.0,
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _currentScreenIndex = 4;
                  });
                },
                icon: SvgPicture.asset(
                  Asset.profileIcon,
                  color: _currentScreenIndex == 4 ? pink : grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
