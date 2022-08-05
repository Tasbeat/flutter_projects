import 'dart:math';

import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  var top = 1;
  var bottom = 1;
  @override
  Widget build(BuildContext context) {
    return 
       Scaffold(
        appBar: _getGamePageBar(),
        body: SafeArea(
          child: _getbody(),
        ),
      
    );
  }

  Widget _getbody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image(
            image: AssetImage('images/$top.png'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
              minimumSize: Size(150, 40),
            ),
            onPressed: () {
              setState(() {
                bottom = Random().nextInt(3) + 1;
                top = Random().nextInt(3) + 1;
              });
            },
            child: Text(
              'شروع بازی',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          Image(
            image: AssetImage('images/$bottom.png'),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _getGamePageBar() {
    return AppBar(
      backgroundColor: Colors.blue[700],
      title: Text(
        'سنگ   کاغذ   قیچی',
        style: TextStyle(color: Colors.black),
      ),
      centerTitle: true,
    );
  }
}
