import 'package:flutter/material.dart';
import 'package:instagram_clone/asset.dart';
import 'package:instagram_clone/data/data.dart';

class CustomAppBar extends StatelessWidget {
  final List<Widget> actions;
  final Widget leadingWidget;
  final double leadingWidth;
  const CustomAppBar(
      {Key? key,
      required this.actions,
      required this.leadingWidth,
      required this.leadingWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: black,
      elevation: 0.0,
      leading: leadingWidget,
      actions: actions,
      leadingWidth: leadingWidth,
    );
  }
}
