import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SnakeGame(),
    );
  }
}

class SnakeGame extends StatefulWidget {
  const SnakeGame({super.key});

  @override
  State<SnakeGame> createState() => _SnakeGameState();
}

class _SnakeGameState extends State<SnakeGame> {
  final int _itemsPerRow = 25;
  final int _itemsPerCol = 40;
  final _randomGen = Random();
  var _snakeCoors = [
    [10, 10],
    [10, 9]
  ];
  var _foodCoor = [0, 2];
  var snakeDirection = 'up';
  var _isGamePlaying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onVerticalDragUpdate: (details) {
                if (snakeDirection != 'up' && details.delta.dy > 0) {
                  snakeDirection = 'down';
                } else if (snakeDirection != 'down' && details.delta.dy < 0) {
                  snakeDirection = 'up';
                }
              },
              onHorizontalDragUpdate: (details) {
                if (snakeDirection != 'left' && details.delta.dx > 0) {
                  snakeDirection = 'right';
                } else if (snakeDirection != 'right' && details.delta.dx < 0) {
                  snakeDirection = 'left';
                }
              },
              child: AspectRatio(
                aspectRatio: _itemsPerRow / (_itemsPerCol + 5),
                child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: _itemsPerRow,
                    ),
                    itemCount: _itemsPerRow * _itemsPerCol,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          color: _getItemColor(index),
                          shape: BoxShape.circle,
                        ),
                      );
                    }),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          _isGamePlaying ? Colors.red : Colors.green,
                    ),
                    child: Text(
                      _isGamePlaying ? 'End' : 'Start',
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () {
                      if (_isGamePlaying) {
                        _isGamePlaying = false;
                      } else {
                        _startGame();
                      }
                    }),
                Text(
                  'Score: ${_snakeCoors.length - 2}',
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color? _getItemColor(int index) {
    var x = index % _itemsPerRow;
    var y = (index / _itemsPerRow).floor();

    bool isSnakeBody = false;
    for (var coordinate in _snakeCoors) {
      if (coordinate[0] == x && coordinate[1] == y) {
        isSnakeBody = true;
        break;
      }
    }

    if (_snakeCoors.first[0] == x && _snakeCoors.first[1] == y) {
      return Colors.blue;
    } else if (isSnakeBody) {
      return Colors.blue[200];
    } else if (_foodCoor[0] == x && _foodCoor[1] == y) {
      return Colors.red;
    } else {
      return const Color.fromARGB(255, 81, 80, 80);
    }
  }

  void _startGame() {
    _isGamePlaying = true;
    const duration = Duration(milliseconds: 200);
    _snakeCoors = [
      [(_itemsPerRow / 2).floor(), (_itemsPerCol / 2).floor()]
    ];
    _snakeCoors.add([_snakeCoors.first[0], _snakeCoors.first[1] + 1]);
    _generateFood();
    Timer.periodic(duration, (Timer timer) {
      _moveSnake();
      if (_checkGameOver()) {
        timer.cancel();
        _endGame();
      }
    });
  }

  void _moveSnake() {
    setState(() {
      switch (snakeDirection) {
        case 'up':
          _snakeCoors
              .insert(0, [_snakeCoors.first[0], _snakeCoors.first[1] - 1]);
          break;

        case 'down':
          _snakeCoors
              .insert(0, [_snakeCoors.first[0], _snakeCoors.first[1] + 1]);
          break;

        case 'left':
          _snakeCoors
              .insert(0, [_snakeCoors.first[0] - 1, _snakeCoors.first[1]]);
          break;

        case 'right':
          _snakeCoors
              .insert(0, [_snakeCoors.first[0] + 1, _snakeCoors.first[1]]);
          break;
      }

      if (_snakeCoors.first[0] != _foodCoor[0] ||
          _snakeCoors.first[1] != _foodCoor[1]) {
        _snakeCoors.removeLast();
      } else {
        _generateFood();
      }
    });
  }

  void _generateFood() {
    _foodCoor = [
      _randomGen.nextInt(_itemsPerRow),
      _randomGen.nextInt(_itemsPerCol)
    ];
  }

  bool _checkGameOver() {
    if (!_isGamePlaying) {
      return true;
    }
    if (_snakeCoors.first[0] >= _itemsPerRow) {
      setState(() {
        _snakeCoors.first[0] = _snakeCoors.first[0] - _itemsPerRow;
      });
      return false;
    }
    if (_snakeCoors.first[0] < 0) {
      setState(() {
        _snakeCoors.first[0] = _snakeCoors.first[0] + _itemsPerRow;
      });
      return false;
    }
    if (_snakeCoors.first[1] < 0) {
      setState(() {
        _snakeCoors.first[1] = _snakeCoors.first[1] + _itemsPerCol;
      });
      return false;
    }
    if (_snakeCoors.first[1] >= _itemsPerCol) {
      setState(() {
        _snakeCoors.first[1] = _snakeCoors.first[1] - _itemsPerCol;
      });
      return false;
    }
    for (var i = 1; i < _snakeCoors.length; ++i) {
      if (_snakeCoors[i][0] == _snakeCoors.first[0] &&
          _snakeCoors[i][1] == _snakeCoors.first[1]) {
        return true;
      }
    }

    return false;
  }

  void _endGame() {
    _isGamePlaying = false;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Game Over'),
            content: Text(
              'Score: ${_snakeCoors.length - 2}',
              style: const TextStyle(fontSize: 20),
            ),
            actions: [
              ElevatedButton(
                child: const Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
