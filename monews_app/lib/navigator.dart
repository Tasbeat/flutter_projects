import 'package:flutter/material.dart';

void navigator(
    {required BuildContext context,
    required Widget destinationPage,
    required bool isPush}) {
  switch (isPush) {
    case true:
      Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => destinationPage),
      );
      break;
    default:
      Navigator.pop(context);
  }
}
