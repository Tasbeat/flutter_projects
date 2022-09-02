import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weatherman_app/constants/constants.dart';
import 'package:weatherman_app/data/model/city_weather_model.dart';
import 'package:weatherman_app/pages/weather_screen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Weatherman',
              style: TextStyle(fontSize: 30, color: Colors.blue),
            ),
            Image(
              image: AssetImage('assets/images/ios-weather.png'),
            ),
            SpinKitSpinningLines(
              color: greenColor,
              size: 60,
              lineWidth: 3,
              itemCount: 7,
            )
          ],
        ),
      ),
    );
  }

  String cityName = 'tehran';
  Future<void> getDataFromAPI() async {
    Response response = await Dio().get(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&lang=fa&&units=metric&appid=604a5a2d0698e550e7ef5281689d43b5');
    Map<String, dynamic> jsonMapObject = response.data;
    CityWeather cityWeather = CityWeather.fromMapJson(jsonMapObject);
    Future.delayed(const Duration(seconds: 3), () {
      _goToWeatherPage(cityWeather);
    });
  }

  void _goToWeatherPage(CityWeather cityWeather) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) =>
            WeatherScreen(cityWeather: cityWeather),
      ),
    );
  }
}
