import 'package:flutter/material.dart';

Widget getThreeRowElements(
    {int? firstElement,
    int? secondElement,
    int? thirdElement,
    String? fourthElement}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Expanded(
        child: Container(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              child: Center(
                child: Text(
                  '$firstElement',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 30.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
      Expanded(
        child: Container(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              child: Center(
                child: Text(
                  '$secondElement',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 30.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
      Expanded(
        child: Container(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              child: Center(
                child: Text(
                  '$thirdElement',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 30.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
      Expanded(
        child: Container(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              child: Center(
                child: Text(
                  fourthElement!,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 30.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget getLastRowElements() {
  return Row(
    children: [
      Expanded(
        flex: 3,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            child: Container(
              alignment: Alignment.center,
              child: Center(
                child: Text(
                  '0',
                  style: TextStyle(color: Colors.grey, fontSize: 30.0),
                ),
              ),
            ),
          ),
        ),
      ),
      Expanded(
        flex: 1,
        child: Container(
          alignment: Alignment.center,
          child: Center(
            child: Text(
              style: TextStyle(color: Colors.grey, fontSize: 30.0),
              '/',
            ),
          ),
        ),
      ),
    ],
  );
}
