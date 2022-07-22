import 'package:flutter/material.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getApplication();
  }
}

Widget getApplication() {
  return MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.amber,
      body: SafeArea(
        child: DecoratedBox(
          position: DecorationPosition.background,
          decoration: BoxDecoration(
            color: Colors.amber,
            image: DecorationImage(
                image: AssetImage('images/drum.png'), fit: BoxFit.fitWidth),
          ),
          child: getBody(),
        ),
      ),
    ),
  );
}

Widget getBody() {
  return Row(
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: TextButton(
                onPressed: () {},
                child: Text(''),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {},
                child: Text(''),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {},
                child: Text(''),
              ),
            ),
          ],
        ),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: TextButton(
                onPressed: () {},
                child: Text(''),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {},
                child: Text(''),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {},
                child: Text(''),
              ),
            ),
          ],
        ),
      )
    ],
  );
}
