import 'package:flutter/material.dart';
import 'package:monews_app/asset.dart';
import 'package:monews_app/data/data.dart';
import 'package:monews_app/pages/pages.dart';

import '../navigator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _makeDelay();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: _getBody(),
    );
  }

  Container _getBody() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Asset.splashScreenPattern),
          repeat: ImageRepeat.repeatY,
        ),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: const [
          Center(
            child: SizedBox(
              height: 60.0,
              width: 60.0,
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image(
                  image: AssetImage(Asset.monewsLogo),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            child: Text(
              'From\nTasbeat',
              style: TextStyle(
                  color: pink,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SM',
                  fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }

  Future<void> _makeDelay() async {
    await Future.delayed(const Duration(seconds: 3), () => _goToAccountPage());
  }

  void _goToAccountPage() {
    navigator(
      context: context,
      destinationPage: const NavPage(),
      isPush: true,
    );
  }
}
