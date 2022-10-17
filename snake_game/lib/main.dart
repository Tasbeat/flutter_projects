import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: snakeGame(),
    );
  }
}

class snakeGame extends StatefulWidget {
  const snakeGame({super.key});

  @override
  State<snakeGame> createState() => _snakeGameState();
}

class _snakeGameState extends State<snakeGame> {
  var snakeDirection = 'right';

  final int itemPerRow = 25;
  final int itemPerCol = 40;
  final randomGenerator = Random();
  List<List<int>> snakeCoor = [
    [0, 1],
    [0, 0]
  ];
  var foodCoor = [0, 2];

  var isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
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
                  } else if (snakeDirection != 'right' &&
                      details.delta.dx < 0) {
                    snakeDirection = 'left';
                  }
                },
                child: AspectRatio(
                  aspectRatio: itemPerRow / (itemPerCol + 6),
                  child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: itemPerRow,
                      ),
                      itemCount: itemPerRow * itemPerCol,
                      itemBuilder: (BuildContext context, int index) {
                        Color? color;
                        var x = index % itemPerRow;
                        var y = (index / itemPerRow).floor();

                        if (snakeCoor.first[0] == x &&
                            snakeCoor.first[1] == y) {
                          color = Colors.green;
                        } else if (snakeCoor[1][0] == x &&
                            snakeCoor[1][1] == y) {
                          color = Colors.green[200];
                        } else if (foodCoor[0] == x && foodCoor[1] == y) {
                          color = Colors.red;
                        } else {
                          color = Colors.grey[800];
                        }
                        return Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: color,
                            shape: BoxShape.circle,
                          ),
                        );
                      }),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isPlaying ? Colors.red : Colors.blue,
                        ),
                        child: Text(
                          isPlaying ? 'End' : 'Start',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () {
                          if (isPlaying) {
                            isPlaying = false;
                          } else {
                            startGame();
                          }
                        }),
                    Text(
                      'Score: ${snakeCoor.length - 2}',
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  void startGame() {
    const duration = Duration(milliseconds: 300);
    isPlaying = true;
    Timer.periodic(duration, (Timer timer) {
      movesnake();
    });
  }

  void movesnake() {
    setState(() {
      switch (snakeDirection) {
        case 'up':
          break;

        case 'down':
          break;

        case 'left':
          break;

        case 'right':
          break;
      }
    });
  }
}
