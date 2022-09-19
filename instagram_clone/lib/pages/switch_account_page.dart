import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/asset.dart';
import 'package:instagram_clone/data/data.dart';

import 'package:instagram_clone/pages/nav_page.dart';
import 'package:instagram_clone/widgets/widgets.dart';

import '../navigator.dart';

class SwitchAccountPage extends StatelessWidget {
  const SwitchAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: _getBody(context),
    );
  }

  Column _getBody(BuildContext context) {
    return Column(
      children: [_getAccoountSwitchContainter(context), _getFooterBox(context)],
    );
  }

  SizedBox _getFooterBox(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'don\'t have an account? / ',
              style: TextStyle(
                  color: Colors.grey, fontSize: 16.0, fontFamily: 'GB'),
              textAlign: TextAlign.center,
            ),
            Text(
              'Sign Up',
              style: Theme.of(context).textTheme.headline1,
            ),
          ],
        ),
      ),
    );
  }

  Expanded _getAccoountSwitchContainter(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Asset.shapes),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Stack(alignment: Alignment.center, children: [
            Positioned(
              bottom: 70.0,
              child: Container(
                height: 290.0,
                width: 280.0,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(255, 255, 255, 0.2),
                      Color.fromRGBO(255, 255, 255, 0.5)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 70.0,
              child: BlurryContainer(
                blur: 5,
                height: 290.0,
                width: 280.0,
                elevation: 0,
                color: Colors.transparent,
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage(Asset.profilePhoto),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        '_tasbeat_',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomElevatedButton(
                        buttonStyle:
                            Theme.of(context).elevatedButtonTheme.style!,
                        buttonText: const Text('Confirm'),
                        onPressedFunction: () => navigator(
                          context: context,
                          destinationPage: const NavPage(),
                          isPush: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'switch account',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
