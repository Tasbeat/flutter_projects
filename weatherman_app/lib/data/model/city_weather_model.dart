class CityWeather {
  String name;
  String country;
  double tempMin;
  double tempMax;
  double temp;
  String description;
  int pressure;
  int humidity;
  String icon;

  CityWeather(this.country, this.description, this.humidity, this.name,
      this.pressure, this.temp, this.tempMax, this.tempMin, this.icon);

  factory CityWeather.fromMapJson(Map<String, dynamic> jsonMapObject) {
    return CityWeather(
        jsonMapObject['sys']['country'],
        jsonMapObject['weather'][0]['description'],
        jsonMapObject['main']['humidity'],
        jsonMapObject['name'],
        jsonMapObject['main']['pressure'],
        jsonMapObject['main']['temp'],
        jsonMapObject['main']['temp_max'],
        jsonMapObject['main']['temp_min'],
        jsonMapObject['weather'][0]['icon']);
  }
}
