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
  var snakeDirection = 'right';

  final int itemPerRow = 25;
  final int itemPerCol = 40;
  final randomGenerator = Random();
  List<List<int>> snakeCoor = [
    [0, 0],
    [0, 1]
  ];
  var isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
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
                        return Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: Colors.grey[800],
                            shape: BoxShape.circle,
                          ),
                        );
                      }),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                startGame();
              },
              child: Text('start'),
            )
          ],
        ),
      ),
    );
  }

  void startGame() {
    const duration = Duration(milliseconds: 300);
    isPlaying = true;
    Timer.periodic(duration, (Timer timer) {
      moveSnake();
    });
  }

  void moveSnake() {
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
