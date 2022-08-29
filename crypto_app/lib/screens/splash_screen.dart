import 'package:crypto_app/data/constants.dart/constant.dart';
import 'package:crypto_app/data/model/crypto_model.dart';
import 'package:crypto_app/screens/crypto_list_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getDataFromAPI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Image(
                image: AssetImage('assets/images/logo.png'),
              ),
              SpinKitWave(
                color: Colors.white,
                size: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Crypto>? cryptoList;
  getDataFromAPI() async {
    Response response = await Dio().get('https://api.coincap.io/v2/assets');
    List<dynamic> jsonMapsList = response.data['data'];
    cryptoList =
        jsonMapsList.map<Crypto>((e) => Crypto.fromMapObject(e)).toList();

    await goToHomeScreen();
  }

  goToHomeScreen() {
    var duration = const Duration(seconds: 3);
    Future.delayed(
      duration,
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => CryptoListScreen(
              cryptoList: cryptoList,
            ),
          ),
        );
      },
    );
  }
}
