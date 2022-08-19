import 'package:flutter/material.dart';

void navigator(BuildContext context, Widget destPage) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => destPage),
  );
}
