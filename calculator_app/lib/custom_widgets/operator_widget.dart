import 'package:calculator_app/constants/colors.dart';
import 'package:flutter/material.dart';

Widget getOperator(String? operator, {int? flex = 1}) {
  return Expanded(
    flex: flex!,
    child: Container(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          child: Center(
            child: Text(
              operator!,
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
