import 'package:flutter/material.dart';
import 'package:instagram_clone/asset.dart';
import 'package:instagram_clone/data/data.dart';
import 'package:instagram_clone/navigator.dart';

import 'pages.dart';

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
      backgroundColor: transparent,
      body: _getBody(),
    );
  }

  Container _getBody() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Asset.splashPattern),
          repeat: ImageRepeat.repeat,
        ),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: const [
          Center(
            child: Image(
              image: AssetImage(Asset.startLogo),
              width: 155.0,
              height: 77.0,
            ),
          ),
          Positioned(
            bottom: 47,
            child: Text(
              'From\nTasbeat',
              style: TextStyle(color: blue, fontWeight: FontWeight.bold),
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
      destinationPage: LoginPage(),
      isPush: true,
    );
  }
}
