import 'package:flutter/material.dart';

Widget getRowElements(
    {required Widget firstWidget,
    required Widget secondWidget,
    required Widget thirdWidget,
    required Widget fourthWidget,
    int? firstElement,
    int? secondElement,
    int? thirdElement,
    String? fourthElement}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [firstWidget, secondWidget, thirdWidget, fourthWidget],
  );
}
