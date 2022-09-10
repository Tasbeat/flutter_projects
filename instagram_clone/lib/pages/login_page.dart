import 'package:flutter/material.dart';
import 'package:instagram_clone/asset.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: screenSize.height,
          ),
          Positioned(
            child: Container(
              height: 400.0,
              width: screenSize.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff383d9c),
                    Color(0xff8f60c7),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Positioned(
            top: 35.0,
            child: Container(
              height: 400.0,
              width: screenSize.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Asset.rocket),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              height: 250.0,
              width: screenSize.width,
              decoration: const BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
