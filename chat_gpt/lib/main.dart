// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Simple Color Picker')),
        body: SafeArea(
          child: Center(
            child: Column(
              children: const [
                SizedBox(
                  height: 300,
                  width: 300,
                  child: AnimatedContainerExample(),
                ),
                SizedBox(
                  height: 200,
                  width: 200,
                  child: ColorPicker(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({
    Key? key,
  }) : super(key: key);

  @override
  _AnimatedContainerExampleState createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: ValueListenableBuilder(
              valueListenable: _ColorPickerState.valueNotifier,
              builder: (context, value, child) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  width: _isExpanded ? 250.0 : 150.0,
                  height: _isExpanded ? 250.0 : 150.0,
                  color: _isExpanded ? value : value,
                  child: _isExpanded
                      ? Center(
                          child: Text(
                          'collapse',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25.0),
                        ))
                      : Center(
                          child: Text(
                          'Expanded',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        )),
                );
              },
            )),
      ),
    );
  }
}

class ColorPicker extends StatefulWidget {
  const ColorPicker({
    Key? key,
  }) : super(key: key);

  @override
  _ColorPickerState createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  Color selectedColor = Colors.blue;
  static ValueNotifier valueNotifier = ValueNotifier(Colors.blue);

  final List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.pink,
    Colors.purple,
    Colors.teal,
    Colors.grey,
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: _colors.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        final color = _colors[index];

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedColor = color;
              valueNotifier.value = color;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: color,
              border: Border.all(
                color: selectedColor == color ? Colors.white : Colors.grey,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      },
    );
  }
}
