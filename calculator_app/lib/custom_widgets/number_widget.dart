import 'package:calculator_app/constants/colors.dart';
import 'package:flutter/material.dart';

Widget getNumber(String? number, {int? flex = 1}) {
  return Expanded(
    flex: flex!,
    child: Container(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          child: Center(
            child: Text(
              number!,
              style: TextStyle(
                color: textGrey,
                fontSize: 30.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    ),
  );
}
