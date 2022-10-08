import 'package:flutter/material.dart';
import 'package:note_app/pages/test1.dart';

class Test2 extends StatefulWidget {
  final int counter;
  const Test2({
    Key? key,
    required this.counter,
  }) : super(key: key);

  @override
  State<Test2> createState() => _Test2State();
}

class _Test2State extends State<Test2> {
  late int counter;

  @override
  void initState() {
    counter = widget.counter;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: ElevatedButton(
          onPressed: () {
            counter++;
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return Test1(counter: counter);
                },
              ),
            );
          },
          child: Text('Add'),
        ),
      )),
    );
  }
}
