import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/io_client.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class WeatherProvider with ChangeNotifier {
  WeatherResponse _weatherResponse;
  List<Color> _weatherBackG = [Colors.white, Colors.white];

  WeatherResponse get getweatherResponse => _weatherResponse;
  List<Color> get getweatherBackG => _weatherBackG;

  set setWeatherData(WeatherResponse data) {
    _weatherResponse = data;
    notifyListeners();
  }

  set setWeatherBackG(List<Color> colors) {
    _weatherBackG = colors;
    notifyListeners();
  }

  Future<WeatherResponse> getData(String lat, String lon) async {
    WeatherResponse data;
    DataWeather dataWeather;
    var response = await http.get(
      'https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&units=metric&appid=e81f33d4b0951f97644eb0c9718fc510',
    );

    var json = convert.jsonDecode(response.body);
    data = WeatherResponse.fromJson(json);
    setWeatherData = data;
    dataWeather = getDataWeather(
      getweatherResponse.current.weather[0].id,
    );
    setWeatherBackG = dataWeather.colors;
    notifyListeners();
    return data;
  }
}
