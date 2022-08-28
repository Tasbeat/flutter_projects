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
  bool isGameOver = false;
  bool isPlayerAllowToChoose = false;
  var isTimerPermissionToStart = true;
  var playerOWinsCount = 0;
  var playerXWinsCount = 0;
  var turnXColor = Colors.red;
  var turnOColor = Colors.blue;
  int _startTime = 5;

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
      actions: [
        IconButton(
          onPressed: () {
            _resetGameElements();
            playerOWinsCount = 0;
            playerXWinsCount = 0;
          },
          icon: Icon(Icons.refresh),
        ),
      ],
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
        ),
      ],
    );
  }

  Widget _getTimer() {
    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.grey[800]),
          onPressed: isTimerPermissionToStart
              ? () {
                  _startTimer();
                }
              : null,
          child: Text("start"),
        ),
        Text(
          '$_startTime',
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
                  _checkTurnAndSetElement(index);
                  _checkGameVictory();
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
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _resetGameElements() {
    setState(() {
      gridElements = ['', '', '', '', '', '', '', '', ''];
      isGameOver = true;
    });
  }

  void _checkGameVictory() {
    for (int i = 0; i < 9; i += 3) {
      if (gridElements[i] == gridElements[i + 1] &&
          gridElements[i] == gridElements[i + 2] &&
          gridElements[i] != '') {
        _showWinPopUp(gridElements[i]);
        _countPlayersVicrories(gridElements[i]);
        _resetGameElements();
        return;
      }
    }
    for (int j = 0; j < 9; j += 1) {
      if (j == 3) break;
      if (gridElements[j] == gridElements[j + 3] &&
          gridElements[j] == gridElements[j + 6] &&
          gridElements[j] != '') {
        _showWinPopUp(gridElements[j]);
        _countPlayersVicrories(gridElements[j]);
        _resetGameElements();
        return;
      }
    }
    for (int z1 = 0; z1 < 9; z1 += 4) {
      if (z1 == 4) break;
      if (gridElements[z1] == gridElements[z1 + 4] &&
          gridElements[z1] == gridElements[z1 + 8] &&
          gridElements[z1] != '') {
        _showWinPopUp(gridElements[z1]);
        _countPlayersVicrories(gridElements[z1]);
        _resetGameElements();
        return;
      }
    }
    for (int z2 = 2; z2 < 9; z2 += 2) {
      if (z2 == 4) break;
      if (gridElements[z2] == gridElements[z2 + 2] &&
          gridElements[z2] == gridElements[z2 + 4] &&
          gridElements[z2] != '') {
        _showWinPopUp(gridElements[z2]);
        _countPlayersVicrories(gridElements[z2]);
        _resetGameElements();
        return;
      }
    }
    if (isGameOver == false) {
      for (var element in gridElements) {
        if (element == '') return;
      }
      _showEqualPopUp();
      _resetGameElements();
    }
  }

  void _checkTurnAndSetElement(int index) {
    if (gridElements[index] != '') return;
    if (isPlayerAllowToChoose) {
      if (isTurnO) {
        gridElements[index] = 'O';
        isPlayerAllowToChoose = false;
      } else {
        gridElements[index] = 'X';
        isPlayerAllowToChoose = false;
      }
    }
  }

  void _startTimer() {
    setState(() {
      isPlayerAllowToChoose = true;
      isTimerPermissionToStart = false;
    });
    const oneSec = Duration(seconds: 1);
    Timer.periodic(
      oneSec,
      (Timer timer) {
        setState(() {
          if (_startTime == 0) {
            timer.cancel();
            isTurnO = !isTurnO;
            isPlayerAllowToChoose = false;
            isTimerPermissionToStart = true;
            _startTime = 5;
          } else {
            if (isGameOver == true) {
              timer.cancel();
              _startTime = 5;
              isGameOver = false;
              isPlayerAllowToChoose = false;
              isTimerPermissionToStart = true;
              return;
            } else if (!isTimerPermissionToStart) {
              _startTime--;
            }
          }
        });
      },
    );
  }

  void _countPlayersVicrories(String winnerElement) {
    setState(() {
      if (winnerElement == 'X') {
        playerXWinsCount++;
      } else if (winnerElement == 'O') {
        playerOWinsCount++;
      }
    });
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
                Text(playerOWinsCount.toString()),
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
                Text(playerXWinsCount.toString()),
              ],
            ),
          ),
        )
      ],
    );
  }

  void _showWinPopUp(String winnerPlayer) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: Text('You Win!!'),
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image(
                    image: AssetImage('images/winner.png'),
                    width: 200,
                    height: 200,
                  ),
                  Text('Player $winnerPlayer , You Win!!'),
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                child: Text("Close"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  void _showEqualPopUp() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: Text('Draw Match!!'),
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text('No One Win!'),
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                child: Text("Close"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }
}
