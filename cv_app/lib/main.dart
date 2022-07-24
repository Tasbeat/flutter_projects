import 'package:flutter/material.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _getApplication();
  }

  Widget _getApplication() {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'vazir'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _getAppBar(),
        body: SafeArea(
          child: _getBody(),
        ),
      ),
    );
  }

  PreferredSizeWidget _getAppBar() {
    return AppBar(
      backgroundColor: Colors.blue,
      elevation: 0,
      title: Center(
        child: Text('رزومه'),
      ),
    );
  }

  Widget _getBody() {
    return Column(
      children: [
        _getHeader(),
      ],
    );
  }

  Widget _getHeader() {
    return Column(
      children: [
        SizedBox(height: 30),
        Center(
          child: CircleAvatar(
            backgroundColor: Colors.brown,
            backgroundImage: AssetImage('images/flutter.png'),
            radius: 80,
          ),
        ),
        SizedBox(height: 20),
        Text(
          'علی علیرحیمی',
          style: TextStyle(
              fontWeight: FontWeight.w900, fontSize: 20.0, color: Colors.blue),
        ),
      ],
    );
  }
}
