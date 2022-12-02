import 'package:flutter/material.dart';
import 'package:positioned_tap_detector_2/positioned_tap_detector_2.dart';
import 'dart:math';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DotScreen(),
    );
  }
}

class DotScreen extends StatefulWidget {
  const DotScreen({Key? key}) : super(key: key);

  @override
  State<DotScreen> createState() => _DotScreenState();
}

class _DotScreenState extends State<DotScreen> {
  final double _squareSize = 50;
  Offset? _squarePosition;
  double _slope = 0;
  double _xDistance = 0;
  int _tapCount = 0;
  int _randomShapeIndex = 0;
  List<String> myImagesLoc = [
    'assets/images/circle.png',
    'assets/images/heart.png',
    'assets/images/square.png',
    'assets/images/triangle.png',
    'assets/images/cone.png',
    'assets/images/cone_traffic.png',
    'assets/images/broken_heart.png',
    'assets/images/polygon.png',
  ];

  void moveRight(double slope, int i) {
    Timer.periodic(const Duration(milliseconds: 8), (timer) {
      if (_tapCount != i) {
        timer.cancel();
//Stop moving in this direction when the screen is tapped again
      }
      _xDistance = sqrt(1 / (1 + pow(slope, 2)));
      setState(() {
        _squarePosition = Offset(_squarePosition!.dx + _xDistance,
            _squarePosition!.dy - slope * _xDistance);
      });

//if the ball bounces off the top or bottom

      if (_squarePosition!.dy < 0 ||
          _squarePosition!.dy >
              MediaQuery.of(context).size.height - _squareSize) {
        timer.cancel();
        moveRight(-slope, i);
      }
//if the ball bounces off the right
      if (_squarePosition!.dx >
          MediaQuery.of(context).size.width - _squareSize) {
        timer.cancel();
        moveLeft(-slope, i);
      }
    });
  }

  void moveLeft(double slope, int i) {
    Timer.periodic(const Duration(milliseconds: 8), (timer) {
      if (_tapCount != i) {
        timer.cancel();
//Stop moving in this direction when the screen is tapped again

      }
      _xDistance = sqrt(1 / (1 + pow(slope, 2)));
      setState(() {
        _squarePosition = Offset(_squarePosition!.dx - _xDistance,
            _squarePosition!.dy + slope * _xDistance);
      });

//if the ball bounces off the top or bottom
      if (_squarePosition!.dy < 0 ||
          _squarePosition!.dy >
              MediaQuery.of(context).size.height - _squareSize) {
        timer.cancel();
        moveLeft(-slope, i);
      }
//if the ball bounces off the left
      if (_squarePosition!.dx < 0) {
        timer.cancel();
        moveRight(-slope, i);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _squarePosition ??= Offset(
        (MediaQuery.of(context).size.width - _squareSize) / 2,
        (MediaQuery.of(context).size.height - _squareSize) / 2);

    return Scaffold(
      body: Stack(
        children: [
          PositionedTapDetector2(
            onTap: (position) {
              _tapCount++;
              _slope = (-position.global.dy + _squarePosition!.dy) /
                  (position.global.dx - _squarePosition!.dx);
              if (position.global.dx < _squarePosition!.dx) {
                moveLeft(_slope, _tapCount);
              }
              if (position.global.dx > _squarePosition!.dx) {
                moveRight(_slope, _tapCount);
              }
            },
            onLongPress: (position) {
              _tapCount++; //stop moving
              setState(() {
                _squarePosition = Offset(
                    (MediaQuery.of(context).size.width - _squareSize) / 2,
                    (MediaQuery.of(context).size.height - _squareSize) / 2);
                //reset back to middle
              });
            },
          ),
          Positioned(
            left: _squarePosition!.dx,
            top: _squarePosition!.dy,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _randomShapeIndex = Random().nextInt(8);
                });
              },
              child: Container(
                child: Image.asset(myImagesLoc[_randomShapeIndex]),
                height: _squareSize,
                width: _squareSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
