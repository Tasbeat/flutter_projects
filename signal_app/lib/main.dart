import 'package:flutter/material.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getHomeScreenBar(),
      body: SafeArea(
        child: Center(
          child: TextButton(
            child: Text('Home Page'),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => SecondScreen(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _getHomeScreenBar() {
    return AppBar(
      elevation: 10.0,
      title: Text(
        'Home Screen',
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getSecondScreenBar(),
      body: SafeArea(
        child: Center(
          child: TextButton(
            onPressed: () {
              Navigator.of(context).pop(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return HomeScreen();
                  },
                ),
              );
            },
            child: Text('Go to first page'),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _getSecondScreenBar() {
    return AppBar(
      elevation: 10.0,
      backgroundColor: Colors.amber,
      title: Text(
        'Second Screen',
      ),
    );
  }
}
