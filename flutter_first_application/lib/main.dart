import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  var application = Application();
  runApp(application);
}

Widget getApplication() {
  return MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.blue,
      body: getBody(),
    ),
  );
}

Widget getBody() {
  return SafeArea(
    child: Center(
      child: Column(
        children: [
          setAndGetContainer(
              width: 70.0,
              height: 70.0,
              margin: 50.0,
              color: Colors.pink,
              padding: 5.0,
              pathOrUrl: 'images/flags.png'),
          setAndGetContainer(
              width: 70.0,
              height: 70.0,
              margin: 50.0,
              color: Colors.brown,
              padding: 5.0,
              text: 'Ali'),
          setAndGetContainer(
            width: 70.0,
            height: 70.0,
            margin: 50.0,
            color: Colors.deepPurple,
            padding: 5.0,
            pathOrUrl: 'images/flags.png',
          ),
        ],
      ),
    ),
  );
}

//Image(image : NetworkImage('url'),)
//Image(image : AssetImage('path'),)
class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return getApplication();
  }
}

Widget setAndGetContainer(
    {required double width,
    required double height,
    required Color color,
    required double margin,
    required double padding,
    String? text,
    String? pathOrUrl}) {
  if (pathOrUrl != null && text != null) return Text("error");
  if (pathOrUrl != null) {
    if (pathOrUrl.startsWith('https')) {
      return Container(
        color: color,
        width: width,
        height: height,
        margin: EdgeInsets.all(margin),
        padding: EdgeInsets.all(padding),
        child: Center(
          child: Image(
            image: NetworkImage(pathOrUrl),
          ),
        ),
      );
    } else {
      return Container(
        color: color,
        width: width,
        height: height,
        margin: EdgeInsets.all(margin),
        padding: EdgeInsets.all(padding),
        child: Center(
          child: Image(
            image: AssetImage(pathOrUrl),
          ),
        ),
      );
    }
  } else if (text == null) {
    return Container(
      color: color,
      width: width,
      height: height,
      margin: EdgeInsets.all(margin),
      padding: EdgeInsets.all(padding),
    );
  } else {
    return Container(
      color: color,
      width: width,
      height: height,
      margin: EdgeInsets.all(margin),
      padding: EdgeInsets.all(padding),
      child: Center(
        child: Text(text),
      ),
    );
  }
}
