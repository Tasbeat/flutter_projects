import 'package:flutter/material.dart';
import 'package:note_app/pages/add_task_page.dart';

import 'pages.dart';

class NavPage extends StatefulWidget {
  const NavPage({Key? key}) : super(key: key);

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  List<Widget> pages = [
    HomePage(
      key: PageStorageKey('HomePage'),
    ),
    AddTaskPage(
      key: PageStorageKey('AddTaskPage'),
    ),
    Container(),
    Container(),
  ];
  int _currentScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages[_currentScreenIndex],
      bottomNavigationBar: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
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
          icon: Icon(Icons.abc),
          label: 'home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.abc),
          label: 'explore',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.abc),
          label: 'newPost',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.abc),
          label: 'notifications',
        ),
      ],
      currentIndex: _currentScreenIndex,
      onTap: (value) {
        setState(
          () {
            _currentScreenIndex = value;
          },
        );
      },
    );
  }
}
