import 'dart:async';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> gridElements = ['', '', '', '', '', '', '', '', ''];
  bool isTurnO = false;
  bool isAllowToChoose = false;
  var turnXColor = Colors.red;
  var turnOColor = Colors.blue;
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
          style: ElevatedButton.styleFrom(primary: Colors.grey[800]),
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
      isTurnO ? 'Turn O' : 'Turn X',
      style: TextStyle(
        color: isTurnO ? turnOColor : turnXColor,
        fontSize: 20.0,
        shadows: [
          Shadow(
            blurRadius: 8.0,
            color: isTurnO ? turnXColor : turnOColor,
            offset: Offset(2.0, 2.0),
          ),
        ],
      ),
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
              setState(
                () {
                  checkTurnAndSetElement(index);
                  checkGameVictory();
                },
              );
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: Center(
                  child: Text(
                gridElements[index],
                style: TextStyle(
                    color:
                        gridElements[index] == 'O' ? Colors.blue : Colors.red,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              )),
            ),
          );
        },
      ),
    );
  }

  void checkGameVictory() {
    for (int i = 0; i < 9; i += 3) {
      if (gridElements[i] == gridElements[i + 1] &&
          gridElements[i] == gridElements[i + 2] &&
          gridElements[i] != '') {
        print('winner is ${gridElements[i]}');
      }
    }
    for (int j = 0; j < 9; j += 1) {
      if (j == 3) break;
      if (gridElements[j] == gridElements[j + 3] &&
          gridElements[j] == gridElements[j + 6] &&
          gridElements[j] != '') {
        print('winner is ${gridElements[j]}');
      }
    }
    for (int z1 = 0; z1 < 9; z1 += 4) {
      if (z1 == 4) break;
      if (gridElements[z1] == gridElements[z1 + 4] &&
          gridElements[z1] == gridElements[z1 + 8] &&
          gridElements[z1] != '') {
        print('winner is ${gridElements[z1]}');
      }
    }
    for (int z2 = 2; z2 < 9; z2 += 2) {
      if (z2 == 4) break;
      if (gridElements[z2] == gridElements[z2 + 2] &&
          gridElements[z2] == gridElements[z2 + 4] &&
          gridElements[z2] != '') {
        print('winner is ${gridElements[z2]}');
      }
    }
  }

  void checkTurnAndSetElement(int index) {
    if (gridElements[index] != '') return;
    if (isAllowToChoose) {
      if (isTurnO) {
        gridElements[index] = 'O';
        isAllowToChoose = false;
      } else {
        gridElements[index] = 'X';
        isAllowToChoose = false;
      }
    }
  }

  int _start = 5;
  void startTimer() {
    setState(() {
      isAllowToChoose = true;
    });
    const oneSec = Duration(seconds: 1);
    Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            isTurnO = !isTurnO;
            isAllowToChoose = false;
            _start = 5;
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
        _getTimer(),
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
