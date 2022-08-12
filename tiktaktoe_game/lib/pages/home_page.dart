import 'dart:async';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: _getAppBar(),
      body: SafeArea(
        child: _getBody(),
      ),
    );
  }

  PreferredSizeWidget _getAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text('Tik Tak Toe'),
      backgroundColor: Colors.grey[900],
    );
  }

  Widget _getBody() {
    return Column(
      children: [
        SizedBox(height: 10.0),
        _getScoreBoard(),
        SizedBox(height: 10.0),
        _getGameGrid(),
        SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _getTimer(),
            _getTurnText(),
          ],
        )
      ],
    );
  }

  Widget _getTimer() {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            startTimer();
          },
          child: Text("start"),
        ),
        Text(
          '$_start',
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  Widget _getTurnText() {
    return Text(
      'Turn X',
      style: TextStyle(color: Colors.red, fontSize: 20.0),
    );
  }

  Widget _getGameGrid() {
    return Container(
      padding: EdgeInsets.all(10),
      height: 360.0,
      child: GridView.builder(
        itemCount: 9,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              print(index);
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
            ),
          );
        },
      ),
    );
  }

  int _start = 10;
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            _start = 10;
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  Widget _getScoreBoard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Card(
          shadowColor: Colors.blue,
          elevation: 15.0,
          color: Colors.blue,
          child: Container(
            width: 80.0,
            height: 80.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Player O'),
                SizedBox(height: 15.0),
                Text('0'),
              ],
            ),
          ),
        ),
        Card(
          shadowColor: Colors.red,
          elevation: 15.0,
          color: Colors.red,
          child: Container(
            width: 80.0,
            height: 80.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Player X'),
                SizedBox(height: 15.0),
                Text('1'),
              ],
            ),
          ),
        )
      ],
    );
  }
}
