import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  final userCorrectAnswersNumber;
  final userWrongAnswersNumber;
  ResultPage(
      {Key? key, this.userCorrectAnswersNumber, this.userWrongAnswersNumber})
      : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(widget.userCorrectAnswersNumber),
            Text(widget.userWrongAnswersNumber),
          ],
        ),
      ),
    );
  }
}
