import 'package:connect_to_internet/data/model/Crypto.dart';
import 'package:connect_to_internet/pages/second_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../data/model/User.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user;

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: const SpinKitFadingCube(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }

  getData() async {
    // var uri = Uri.parse('https://jsonplaceholder.typicode.com/users');
    // Response response = await get(uri);
    // var name = jsonDecode(response.body)[1]['name'];
    // var username = jsonDecode(response.body)[0]['username'];
    // var id = jsonDecode(response.body)[0]['id'];
    // var email = jsonDecode(response.body)[0]['eamil'];

    // user = User(email, id, name, username);

    var response = await Dio().get('https://api.coincap.io/v2/assets');
    List<dynamic> jsonMapsObjectList = response.data['data'];
    List<Crypto> cryptoList =
        jsonMapsObjectList.map<Crypto>((e) => Crypto.fromMapJson(e)).toList();

    await Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SecondScreen(
              cryptoList: cryptoList,
            ),
          ),
        );
      },
    );
  }
}
