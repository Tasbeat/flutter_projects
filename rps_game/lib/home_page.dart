import 'package:flutter/material.dart';
import 'package:rps_game/game_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _getHomePageBar(),
        body: _getBody(context),
      ),
    );
  }

  Widget _getBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _getWelcomeText(),
        _getRPSImage(),
        _getGameEnterButton(context),
      ],
    );
  }

  Widget _getRPSImage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 330.0,
          height: 350.0,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Image(
              image: AssetImage('images/rps.png'),
            ),
          ),
        ),
        SizedBox(width: 20.0)
      ],
    );
  }

  Widget _getGameEnterButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => GamePage(),
          ),
        );
      },
      child: Text('ورود به بازی'),
    );
  }

  Widget _getWelcomeText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'خوش آمدید!',
          textDirection: TextDirection.rtl,
          style: TextStyle(color: Colors.black),
        ),
        SizedBox(width: 5),
        Icon(
          Icons.login,
          color: Colors.black,
          size: 18,
        )
      ],
    );
  }

  PreferredSizeWidget _getHomePageBar() {
    return AppBar(
      backgroundColor: Colors.blue[700],
      title: Text(
        'خانه',
        style: TextStyle(color: Colors.black),
      ),
      centerTitle: true,
    );
  }
}
