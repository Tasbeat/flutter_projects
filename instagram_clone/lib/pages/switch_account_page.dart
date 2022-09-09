import 'package:flutter/material.dart';
import 'package:instagram_clone/asset.dart';
import 'package:instagram_clone/data/data.dart';

class SwitchAccountPage extends StatelessWidget {
  const SwitchAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: _getBody(),
    );
  }

  Column _getBody() {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Asset.shapes),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Stack(children: [
                Container(
                  height: 290.0,
                  width: 280.0,
                  child: Column(
                    children: [
                      Text('data'),
                      Text('data'),
                      Text('data'),
                    ],
                  ),
                ),
                Container(
                  height: 290.0,
                  width: 280.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    gradient: LinearGradient(colors: [
                      white.withOpacity(0.5),
                      white.withOpacity(0.2)
                    ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                  ),
                )
              ]),
            ),
          ),
        ),
        const SizedBox(
          height: 100.0,
          child: Center(
            child: Text(
              'Don’t have an account? / Sign up',
              style: TextStyle(color: white),
            ),
          ),
        )
      ],
    );
  }
}
