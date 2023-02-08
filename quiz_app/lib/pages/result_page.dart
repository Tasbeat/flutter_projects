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
      appBar: _getAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Image(
                image: AssetImage('images/cup.png'),
              ),
            ),
            Text(
              'True Answers:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              widget.userCorrectAnswersNumber,
              style: TextStyle(color: Colors.green, fontSize: 60),
            ),
            Text(
              'Wrong Answers:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              widget.userWrongAnswersNumber,
              style: TextStyle(color: Colors.red, fontSize: 60),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _getAppBar() {
    return AppBar(
      title: Text('Result'),
      centerTitle: true,
      backgroundColor: Colors.red[900],
    );
  }
}
