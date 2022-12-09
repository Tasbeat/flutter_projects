import 'dart:ui';

import 'package:ecommerce_app/constants/asset.dart';
import 'package:ecommerce_app/constants/colors.dart';
import 'package:flutter/material.dart';

import 'pages.dart';

class NavPage extends StatefulWidget {
  const NavPage({super.key});

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int selectedBottomNavigationIndex = 3;
  List<Widget> getScreens = [
    const ProfileScreen(),
    const CategoryScreen(),
    const ProductListScreen(),
    const Homepage()
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: getScreens[selectedBottomNavigationIndex],
        bottomNavigationBar: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              onTap: (value) {
                setState(
                  () {
                    selectedBottomNavigationIndex = value;
                  },
                );
              },
              currentIndex: selectedBottomNavigationIndex,
              backgroundColor: Colors.transparent,
              elevation: 0,
              selectedLabelStyle: const TextStyle(
                  fontFamily: 'SB', fontSize: 10, color: CustomColors.blue),
              unselectedLabelStyle: const TextStyle(
                  fontFamily: 'SB', fontSize: 10, color: Colors.black),
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(Asset.profileIcon),
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: Container(
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: CustomColors.blue,
                          blurRadius: 20,
                          spreadRadius: -7,
                          offset: Offset(0.0, 13),
                        )
                      ]),
                      child: Image.asset(Asset.profileActiveIcon),
                    ),
                  ),
                  label: 'حساب کاربری',
                ),
                BottomNavigationBarItem(
                    icon: Image.asset(Asset.basketIcon),
                    activeIcon: Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: Container(
                        decoration: const BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: CustomColors.blue,
                              blurRadius: 20,
                              spreadRadius: -7,
                              offset: Offset(0.0, 13))
                        ]),
                        child: Image.asset(Asset.basketActiveIcon),
                      ),
                    ),
                    label: 'سبد خرید'),
                BottomNavigationBarItem(
                  icon: Image.asset(Asset.categoryIcon),
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: Container(
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: CustomColors.blue,
                            blurRadius: 20,
                            spreadRadius: -7,
                            offset: Offset(0.0, 13))
                      ]),
                      child: Image.asset(Asset.categoryActiveIcon),
                    ),
                  ),
                  label: 'دسته بندی',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(Asset.homeIcon),
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: Container(
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: CustomColors.blue,
                            blurRadius: 20,
                            spreadRadius: -7,
                            offset: Offset(0.0, 13))
                      ]),
                      child: Image.asset(Asset.homeActiveIcon),
                    ),
                  ),
                  label: 'خانه',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
