import 'package:flutter/material.dart';
import 'package:note_app/navigator.dart';
import 'package:note_app/pages/test2.dart';

class Test1 extends StatefulWidget {
  final int counter;

  const Test1({super.key, required this.counter});

  @override
  State<Test1> createState() => _Test1State();
}

class _Test1State extends State<Test1> {
  int counter = 0;
  ValueNotifier valueNotifier = ValueNotifier(0);

  @override
  void initState() {
    counter = widget.counter;
    valueNotifier.value = counter;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ValueListenableBuilder(
            builder: (context, value, child) {
              return Text('$value');
            },
            valueListenable: valueNotifier,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => navigator(
          context: context,
          destinationPage: Test2(counter: counter),
          isPush: true,
        ),
      ),
    );
  }
}
