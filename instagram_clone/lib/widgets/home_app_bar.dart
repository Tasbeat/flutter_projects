import 'package:flutter/material.dart';
import 'package:instagram_clone/asset.dart';
import 'package:instagram_clone/data/data.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: black,
      elevation: 0.0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Image.asset(Asset.moodinegarLogo),
      ),
      actions: [
        Image.asset(Asset.directIcon),
      ],
      leadingWidth: 130.0,
    );
  }
}
