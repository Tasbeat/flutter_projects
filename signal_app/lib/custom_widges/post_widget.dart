import 'package:flutter/material.dart';

Widget getBlogPost(String names, String cryptoName) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      _getClipRRect(names),
      SizedBox(height: 8.0),
      _getTitle(cryptoName),
      SizedBox(height: 10.0),
      _getSubTitle(),
      SizedBox(
        height: 10.0,
      ),
      Container(
        width: 200.0,
        child: Divider(
          color: Colors.black,
          thickness: 1,
        ),
      ),
      SizedBox(
        height: 10.0,
      ),
    ],
  );
}

Widget _getSubTitle() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'فروش',
        style: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(width: 5.0),
      Icon(
        Icons.sell,
        color: Colors.red,
      ),
      SizedBox(width: 40),
      Text(
        'خرید',
        style: TextStyle(
          color: Colors.green,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(width: 5),
      Icon(
        Icons.monetization_on_sharp,
        color: Colors.green,
      ),
    ],
  );
}

Widget _getTitle(String name) {
  return Text(
    'سیگنال خرید ${name} برای 14 مرداد',
    textDirection: TextDirection.rtl,
    textAlign: TextAlign.center,
    style: TextStyle(fontSize: 16.0),
  );
}

Widget _getClipRRect(String image) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(10.0),
    child: Image(
      image: AssetImage('images/$image'),
    ),
  );
}
