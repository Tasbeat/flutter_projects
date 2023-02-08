import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:weatherman_app/constants/constants.dart';
import 'package:weatherman_app/data/model/city_weather_model.dart';

import '../theme_manager.dart';

class WeatherScreen extends StatefulWidget {
  final CityWeather? cityWeather;
  const WeatherScreen({Key? key, this.cityWeather}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  CityWeather? cityWeather;

  @override
  void initState() {
    super.initState();
    cityWeather = widget.cityWeather;
  }

  var isSwitchOn = true;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Consumer<ThemeNotifier>(
        builder: (context, theme, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme.getTheme(),
          home: SafeArea(
            child: Scaffold(
              appBar: _getAppBar(theme),
              body: _getBody(),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          title: const Text('Are you sure?'),
          content: const Text('Do you want to exit?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () => SystemNavigator.pop(),
              child: const Text('Yes'),
            ),
          ],
        ),
      ),
    ));
  }

  String cityName = 'tehran';
  Future<void> getDataFromAPI() async {
    try {
      Response response = await Dio().get(
          'https://api.openweathermap.org/data/2.5/weather?q=$cityName&lang=fa&units=metric&appid=604a5a2d0698e550e7ef5281689d43b5');
      Map<String, dynamic> jsonMapObject = response.data;
      setState(() {
        cityWeather = CityWeather.fromMapJson(jsonMapObject);
      });
    } catch (e) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: AlertDialog(
                title: const Text(
                  'City not found!',
                  style: TextStyle(fontSize: 18),
                ),
                actions: [
                  ElevatedButton(
                    child: const Text("Ok"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            );
          });
    }
  }

  AppBar _getAppBar(ThemeNotifier theme) {
    return AppBar(
      leading: InkWell(
        child: const Icon(Icons.search, size: 30),
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: AlertDialog(
                    scrollable: true,
                    title: const Text(
                      'Search City',
                      style: TextStyle(fontSize: 16),
                    ),
                    content: Column(
                      children: [
                        TextField(
                          onChanged: (value) {
                            setState(() {
                              cityName = value.toLowerCase();
                            });
                          },
                        ),
                      ],
                    ),
                    actions: [
                      ElevatedButton(
                        child: const Text("Search"),
                        onPressed: () {
                          getDataFromAPI();
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                );
              });
        },
      ),
      actions: [
        Switch(
          value: isSwitchOn,
          onChanged: (bool state) {
            setState(
              () {
                if (isSwitchOn) {
                  theme.setLightMode();
                  isSwitchOn = false;
                } else {
                  theme.setDarkMode();
                  isSwitchOn = true;
                }
              },
            );
          },
        ),
      ],
      centerTitle: true,
      title: const Text('Weatherman'),
    );
  }

  Widget _getBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _setIconAndTemp(),
          _getCityName(),
          const SizedBox(height: 30.0),
          SizedBox(width: 300.0, child: _getCardData()),
          const SizedBox(height: 30.0),
        ],
      ),
    );
  }

  Text _getCityName() {
    return Text(
      cityWeather!.name,
      style: const TextStyle(fontSize: 40),
    );
  }

  Card _getCardData() {
    return Card(
      shadowColor: Colors.blue,
      elevation: 20.0,
      color: Colors.blueAccent[600],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const SizedBox(height: 10.0),
          const Text('Other Information'),
          Divider(
            thickness: 1.0,
            color: isSwitchOn ? Colors.white : Colors.black,
          ),
          _getExtraData(
            'Descrtiption',
            cityWeather!.description,
          ),
          _getExtraData(
            'Highest Temp',
            cityWeather!.tempMax.toString(),
          ),
          _getExtraData(
            'Lowest Temp',
            cityWeather!.tempMin.toString(),
          ),
          _getExtraData(
            'Preasure',
            cityWeather!.pressure.toString(),
          ),
          _getExtraData(
            'Humidity',
            cityWeather!.humidity.toString(),
          ),
          _getExtraData(
            'Tempreture',
            cityWeather!.temp.toString(),
          ),
        ],
      ),
    );
  }

  Row _getExtraData(String subTitle, String data) {
    return Row(
      children: [
        Expanded(
          child: Text(
            data,
            textAlign: TextAlign.center,
            style: const TextStyle(color: greenColor),
          ),
        ),
        Expanded(
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(color: redColor),
          ),
        ),
        const SizedBox(height: 50.0)
      ],
    );
  }

  Row _setIconAndTemp() {
    return Row(
      children: [
        Expanded(
          child: Container(
            width: 150.0,
            height: 150.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.contain,
                image: NetworkImage(
                    'http://openweathermap.org/img/wn/${cityWeather!.icon}@2x.png'),
              ),
            ),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              const Text(
                'Tempreture:',
                style: TextStyle(fontSize: 40),
              ),
              Text(
                cityWeather!.temp.toString(),
                style: const TextStyle(fontSize: 40),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
