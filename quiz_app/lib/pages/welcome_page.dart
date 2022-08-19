import 'package:flutter/material.dart';
import 'package:quiz_app/navigator.dart';
import 'package:quiz_app/pages/quiz_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _getAppBar(),
        backgroundColor: Colors.indigo[900],
        body: _getBody(context));
  }

  Widget _getBody(BuildContext context) {
    return SafeArea(
      child: DecoratedBox(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 40.0,
            ),
            _getStartButton(context)
          ],
        ),
        position: DecorationPosition.background,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('images/quiz-night.png'),
          ),
        ),
      ),
    );
  }

  Widget _getStartButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.pinkAccent[400],
        minimumSize: Size(240.0, 40.0),
      ),
      onPressed: () {
        navigator(
          context,
          QuizPage(),
        );
      },
      child: Text(
        'شروع',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  PreferredSizeWidget _getAppBar() {
    return AppBar(
      title: Text('Quiz Night'),
      centerTitle: true,
      backgroundColor: Colors.indigo[900],
    );
  }
}
