import 'package:flutter/material.dart';

void navigator(BuildContext context, Widget page) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (BuildContext contex) => page,
    ),
  );
}
