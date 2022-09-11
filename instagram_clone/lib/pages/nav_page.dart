import 'package:flutter/material.dart';
import 'package:instagram_clone/data/data.dart';

import 'pages.dart';

class NavPage extends StatefulWidget {
  NavPage({Key? key}) : super(key: key);

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  List<Widget> pages = const [
    HomePage(),
    ExplorePage(),
    NewPostPage(),
    NotificationPage(),
    ProfilePage(),
  ];

  final Map<String, IconData> _icons = {
    'Home': Icons.home,
    'Search': Icons.search,
    'Coming Soon': Icons.queue_play_next,
    'Downloads': Icons.download,
    'More': Icons.menu
  };
  int _currentScreenIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: pages[_currentScreenIndex],
      bottomNavigationBar: Container(
        height: 70.0,
        decoration: const BoxDecoration(
          color: Color(0xff272B40),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              spreadRadius: 0,
              blurRadius: 10,
            ),
          ],
        ),
        child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
            child: _getBottomNavigationBar()),
      ),
    );
  }

  BottomNavigationBar _getBottomNavigationBar() {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: const Color(0xff272B40),
      type: BottomNavigationBarType.fixed,
      items: _icons
          .map(
            (title, icon) => MapEntry(
              title,
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Icon(
                      icon,
                      size: 30.0,
                    ),
                  ),
                  label: title),
            ),
          )
          .values
          .toList(),
      currentIndex: _currentScreenIndex,
      selectedItemColor: pink,
      selectedFontSize: 12.0,
      unselectedFontSize: 11.0,
      unselectedItemColor: grey,
      onTap: (value) {
        setState(() {
          _currentScreenIndex = value;
        });
      },
    );
  }
}
