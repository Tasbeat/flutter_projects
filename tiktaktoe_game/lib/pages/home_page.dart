import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: SafeArea(
        child: _getBody(),
      ),
    );
  }

  PreferredSizeWidget _getAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text('Tik Tak Toe'),
      backgroundColor: Colors.grey[900],
    );
  }

  Widget _getBody() {
    return Column(
      children: [
        SizedBox(height: 15.0),
        _getScoreBoard(),
      ],
    );
  }

  Widget _getScoreBoard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Card(
          shadowColor: Colors.blue,
          elevation: 15.0,
          color: Colors.blue,
          child: Container(
            width: 80.0,
            height: 80.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Player O'),
                SizedBox(height: 15.0),
                Text('0'),
              ],
            ),
          ),
        ),
        Card(
          shadowColor: Colors.red,
          elevation: 15.0,
          color: Colors.red,
          child: Container(
            width: 80.0,
            height: 80.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Player X'),
                SizedBox(height: 15.0),
                Text('1'),
              ],
            ),
          ),
        )
      ],
    );
  }
}
