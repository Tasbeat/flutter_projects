import 'package:flutter/material.dart';

void pushNavigator(BuildContext context, Widget page) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (BuildContext contex) => page,
    ),
  );
}
