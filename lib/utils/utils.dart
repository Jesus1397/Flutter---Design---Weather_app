// import 'package:weather_app/models/weather_model.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert' as convert;

// Future<WeatherResponse> getData({String lon, String lat}) async {
//   WeatherResponse data;
//   var response = await http.get(
//     'https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&units=metric&appid=e81f33d4b0951f97644eb0c9718fc510',
//   );

//   var json = convert.jsonDecode(response.body);

//   data = WeatherResponse.fromJson(json);

//   return data;
// }
