import 'dart:math';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
          ),
          Container(
            child: Text(
              '$index',
              textAlign: TextAlign.center,
            ),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              setState(
                () {
                  index = Random().nextInt(1000) + 1;
                },
              );
            },
            child: Text('click me!'),
          )
        ],
      ),
    );
  }
}
