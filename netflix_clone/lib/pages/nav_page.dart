import 'package:flutter/material.dart';
import 'package:netflix_clone/pages/pages.dart';
import 'package:netflix_clone/widgets/widgets.dart';

class NavPage extends StatefulWidget {
  const NavPage({Key? key}) : super(key: key);

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  final List<Widget> _screensList = [
    HomePage(key: const PageStorageKey('HomePage')),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
  ];

  final Map<String, IconData> _navigationBarIcons = {
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
      body: _screensList[_currentScreenIndex],
      bottomNavigationBar: !Responsive.isDesktop(context)
          ? _getMobileBottomNavigationBar()
          : null,
    );
  }

  BottomNavigationBar _getMobileBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      items: _navigationBarIcons
          .map(
            (title, icon) => MapEntry(
              title,
              BottomNavigationBarItem(
                icon: Icon(
                  icon,
                  size: 30.0,
                ),
                label: title,
              ),
            ),
          )
          .values
          .toList(),
      currentIndex: _currentScreenIndex,
      selectedItemColor: Colors.white,
      selectedFontSize: 12.0,
      unselectedFontSize: 11.0,
      unselectedItemColor: Colors.grey,
      onTap: (value) {
        setState(() {
          _currentScreenIndex = value;
        });
      },
    );
  }
}
