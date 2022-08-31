import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherman_app/data/model/city_weather_model.dart';

import '../theme_manager.dart';

class WeatherScreen extends StatefulWidget {
  CityWeather? cityWeather;
  WeatherScreen({Key? key, this.cityWeather}) : super(key: key);

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
    return Consumer<ThemeNotifier>(
      builder: (context, theme, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme.getTheme(),
        home: SafeArea(
          child: Scaffold(
            appBar: AppBar(
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
                )
              ],
              centerTitle: true,
              title: const Text('ودرمن'),
            ),
            body: _getBody(),
          ),
        ),
      ),
    );
  }

  Widget _getBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _setIconAndTemp(),
      ],
    );
  }

  Row _setIconAndTemp() {
    return Row(
      children: [
        Container(
          height: 200.0,
          width: 200.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.contain,
              image: NetworkImage(
                  'http://openweathermap.org/img/wn/${cityWeather!.icon}@2x.png'),
            ),
          ),
        ),
        Column(
          children: [
            const Text(
              ':دما',
              style: TextStyle(fontSize: 40),
            ),
            Text(
              cityWeather!.temp.toString(),
              style: const TextStyle(fontSize: 40),
            ),
          ],
        ),
      ],
    );
  }
}
