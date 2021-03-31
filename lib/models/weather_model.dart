// To parse this JSON data, do
//
//     final weatherResponse = weatherResponseFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

WeatherResponse weatherResponseFromJson(String str) =>
    WeatherResponse.fromJson(json.decode(str));

String weatherResponseToJson(WeatherResponse data) =>
    json.encode(data.toJson());

class WeatherResponse {
  WeatherResponse({
    this.lat,
    this.lon,
    this.timezone,
    this.timezoneOffset,
    this.current,
    this.minutely,
    this.hourly,
    this.daily,
  });

  double lat;
  double lon;
  String timezone;
  int timezoneOffset;
  Current current;
  List<Minutely> minutely;
  List<Current> hourly;
  List<Daily> daily;

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      WeatherResponse(
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
        timezone: json["timezone"],
        timezoneOffset: json["timezone_offset"],
        current: Current.fromJson(json["current"]),
        minutely: List<Minutely>.from(
            json["minutely"].map((x) => Minutely.fromJson(x))),
        hourly:
            List<Current>.from(json["hourly"].map((x) => Current.fromJson(x))),
        daily: List<Daily>.from(json["daily"].map((x) => Daily.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
        "timezone": timezone,
        "timezone_offset": timezoneOffset,
        "current": current.toJson(),
        "minutely": List<dynamic>.from(minutely.map((x) => x.toJson())),
        "hourly": List<dynamic>.from(hourly.map((x) => x.toJson())),
        "daily": List<dynamic>.from(daily.map((x) => x.toJson())),
      };
}

class Current {
  Current({
    this.dt,
    this.sunrise,
    this.sunset,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.uvi,
    this.clouds,
    this.visibility,
    this.windSpeed,
    this.windDeg,
    this.weather,
    this.windGust,
    this.pop,
  });

  int dt;
  int sunrise;
  int sunset;
  double temp;
  double feelsLike;
  int pressure;
  int humidity;
  double dewPoint;
  double uvi;
  int clouds;
  int visibility;
  double windSpeed;
  int windDeg;
  List<Weather> weather;
  double windGust;
  var pop;

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        dt: json["dt"],
        sunrise: json["sunrise"] == null ? null : json["sunrise"],
        sunset: json["sunset"] == null ? null : json["sunset"],
        temp: json["temp"].toDouble(),
        feelsLike: json["feels_like"].toDouble(),
        pressure: json["pressure"],
        humidity: json["humidity"],
        dewPoint: json["dew_point"].toDouble(),
        uvi: json["uvi"].toDouble(),
        clouds: json["clouds"],
        visibility: json["visibility"],
        windSpeed: json["wind_speed"].toDouble(),
        windDeg: json["wind_deg"],
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        windGust:
            json["wind_gust"] == null ? null : json["wind_gust"].toDouble(),
        pop: json["pop"] == null ? null : json["pop"],
      );

  Map<String, dynamic> toJson() => {
        "dt": dt,
        "sunrise": sunrise == null ? null : sunrise,
        "sunset": sunset == null ? null : sunset,
        "temp": temp,
        "feels_like": feelsLike,
        "pressure": pressure,
        "humidity": humidity,
        "dew_point": dewPoint,
        "uvi": uvi,
        "clouds": clouds,
        "visibility": visibility,
        "wind_speed": windSpeed,
        "wind_deg": windDeg,
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
        "wind_gust": windGust == null ? null : windGust,
        "pop": pop == null ? null : pop,
      };
}

class Weather {
  Weather({
    this.id,
    this.main,
    this.description,
    this.iconWeather,
  });

  int id;
  Main main;
  Description description;
  IconWeather iconWeather;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"],
        main: mainValues.map[json["main"]],
        description: descriptionValues.map[json["description"]],
        iconWeather: iconWeatherValues.map[json["iconWeather"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "main": mainValues.reverse[main],
        "description": descriptionValues.reverse[description],
        "iconWeather": iconWeatherValues.reverse[iconWeather],
      };
}

enum Description {
  CLEAR_SKY,
  BROKEN_CLOUDS,
  SCATTERED_CLOUDS,
  LIGHT_RAIN,
  OVERCAST_CLOUDS,
  FEW_CLOUDS
}

final descriptionValues = EnumValues({
  "broken clouds": Description.BROKEN_CLOUDS,
  "clear sky": Description.CLEAR_SKY,
  "few clouds": Description.FEW_CLOUDS,
  "light rain": Description.LIGHT_RAIN,
  "overcast clouds": Description.OVERCAST_CLOUDS,
  "scattered clouds": Description.SCATTERED_CLOUDS
});

enum IconWeather {
  THE_01_D,
  THE_04_D,
  THE_03_D,
  THE_10_D,
  THE_04_N,
  THE_02_D,
  THE_01_N
}

final iconWeatherValues = EnumValues({
  "01d": IconWeather.THE_01_D,
  "01n": IconWeather.THE_01_N,
  "02d": IconWeather.THE_02_D,
  "03d": IconWeather.THE_03_D,
  "04d": IconWeather.THE_04_D,
  "04n": IconWeather.THE_04_N,
  "10d": IconWeather.THE_10_D
});

enum Main { CLEAR, CLOUDS, RAIN }

final mainValues =
    EnumValues({"Clear": Main.CLEAR, "Clouds": Main.CLOUDS, "Rain": Main.RAIN});

class Daily {
  Daily({
    this.dt,
    this.sunrise,
    this.sunset,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.windSpeed,
    this.windDeg,
    this.weather,
    this.clouds,
    this.pop,
    this.uvi,
    this.rain,
  });

  int dt;
  int sunrise;
  int sunset;
  Temp temp;
  FeelsLike feelsLike;
  int pressure;
  int humidity;
  double dewPoint;
  double windSpeed;
  int windDeg;
  List<Weather> weather;
  int clouds;
  var pop;
  double uvi;
  double rain;

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        dt: json["dt"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        temp: Temp.fromJson(json["temp"]),
        feelsLike: FeelsLike.fromJson(json["feels_like"]),
        pressure: json["pressure"],
        humidity: json["humidity"],
        dewPoint: json["dew_point"].toDouble(),
        windSpeed: json["wind_speed"].toDouble(),
        windDeg: json["wind_deg"],
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        clouds: json["clouds"],
        pop: json["pop"],
        uvi: json["uvi"].toDouble(),
        rain: json["rain"] == null ? null : json["rain"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "dt": dt,
        "sunrise": sunrise,
        "sunset": sunset,
        "temp": temp.toJson(),
        "feels_like": feelsLike.toJson(),
        "pressure": pressure,
        "humidity": humidity,
        "dew_point": dewPoint,
        "wind_speed": windSpeed,
        "wind_deg": windDeg,
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
        "clouds": clouds,
        "pop": pop,
        "uvi": uvi,
        "rain": rain == null ? null : rain,
      };
}

class FeelsLike {
  FeelsLike({
    this.day,
    this.night,
    this.eve,
    this.morn,
  });

  double day;
  double night;
  double eve;
  double morn;

  factory FeelsLike.fromJson(Map<String, dynamic> json) => FeelsLike(
        day: json["day"].toDouble(),
        night: json["night"].toDouble(),
        eve: json["eve"].toDouble(),
        morn: json["morn"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "night": night,
        "eve": eve,
        "morn": morn,
      };
}

class Temp {
  Temp({
    this.day,
    this.min,
    this.max,
    this.night,
    this.eve,
    this.morn,
  });

  double day;
  double min;
  double max;
  double night;
  double eve;
  double morn;

  factory Temp.fromJson(Map<String, dynamic> json) => Temp(
        day: json["day"].toDouble(),
        min: json["min"].toDouble(),
        max: json["max"].toDouble(),
        night: json["night"].toDouble(),
        eve: json["eve"].toDouble(),
        morn: json["morn"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "min": min,
        "max": max,
        "night": night,
        "eve": eve,
        "morn": morn,
      };
}

class Minutely {
  Minutely({
    this.dt,
    this.precipitation,
  });

  var dt;
  var precipitation;

  factory Minutely.fromJson(Map<String, dynamic> json) => Minutely(
        dt: json["dt"],
        precipitation: json["precipitation"],
      );

  Map<String, dynamic> toJson() => {
        "dt": dt,
        "precipitation": precipitation,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

class DataWeather {
  final String mainW;
  final String imgW;
  final List<Color> colors;

  DataWeather({
    @required this.mainW,
    @required this.imgW,
    @required this.colors,
  });
}

getDataWeather(int id) {
  switch (id) {
    case 200:
      return DataWeather(
        mainW: 'Thunderstorm',
        imgW: 'assets/thunderstorm.png',
        colors: [
          Color(0xff5AE2FE),
          Color(0xff5ACBFA),
        ],
      );
      break;
    case 201:
      return DataWeather(
        mainW: 'Thunderstorm',
        imgW: 'assets/thunderstorm.png',
        colors: [
          Color(0xff5AE2FE),
          Color(0xff5ACBFA),
        ],
      );
      break;
    case 202:
      return DataWeather(
        mainW: 'Thunderstorm',
        imgW: 'assets/thunderstorm.png',
        colors: [
          Color(0xff5AE2FE),
          Color(0xff5ACBFA),
        ],
      );
      break;
    case 210:
      return DataWeather(
        mainW: 'Thunderstorm',
        imgW: 'assets/thunderstorm.png',
        colors: [
          Color(0xff5AE2FE),
          Color(0xff5ACBFA),
        ],
      );
      break;
    case 211:
      return DataWeather(
        mainW: 'Thunderstorm',
        imgW: 'assets/thunderstorm.png',
        colors: [
          Color(0xff5AE2FE),
          Color(0xff5ACBFA),
        ],
      );
      break;
    case 212:
      return DataWeather(
        mainW: 'Thunderstorm',
        imgW: 'assets/thunderstorm.png',
        colors: [
          Color(0xff5AE2FE),
          Color(0xff5ACBFA),
        ],
      );
      break;
    case 221:
      return DataWeather(
        mainW: 'Thunderstorm',
        imgW: 'assets/thunderstorm.png',
        colors: [
          Color(0xff5AE2FE),
          Color(0xff5ACBFA),
        ],
      );
      break;
    case 230:
      return DataWeather(
        mainW: 'Thunderstorm',
        imgW: 'assets/thunderstorm.png',
        colors: [
          Color(0xff5AE2FE),
          Color(0xff5ACBFA),
        ],
      );
      break;
    case 231:
      return DataWeather(
        mainW: 'Thunderstorm',
        imgW: 'assets/thunderstorm.png',
        colors: [
          Color(0xff5AE2FE),
          Color(0xff5ACBFA),
        ],
      );
      break;
    case 232:
      return DataWeather(
        mainW: 'Thunderstorm',
        imgW: 'assets/thunderstorm.png',
        colors: [
          Color(0xff5AE2FE),
          Color(0xff5ACBFA),
        ],
      );
      break;
    case 300:
      return DataWeather(
        mainW: 'Drizzle',
        imgW: 'assets/drizzle.png',
        colors: [
          Color(0xff6DFAE5),
          Color(0xff72EFEC),
        ],
      );
      break;
    case 301:
      return DataWeather(
        mainW: 'Drizzle',
        imgW: 'assets/drizzle.png',
        colors: [
          Color(0xff6DFAE5),
          Color(0xff72EFEC),
        ],
      );
      break;
    case 302:
      return DataWeather(
        mainW: 'Drizzle',
        imgW: 'assets/drizzle.png',
        colors: [
          Color(0xff6DFAE5),
          Color(0xff72EFEC),
        ],
      );
      break;
    case 310:
      return DataWeather(
        mainW: 'Drizzle',
        imgW: 'assets/drizzle.png',
        colors: [
          Color(0xff6DFAE5),
          Color(0xff72EFEC),
        ],
      );
      break;
    case 311:
      return DataWeather(
        mainW: 'Drizzle',
        imgW: 'assets/drizzle.png',
        colors: [
          Color(0xff6DFAE5),
          Color(0xff72EFEC),
        ],
      );
      break;
    case 312:
      return DataWeather(
        mainW: 'Drizzle',
        imgW: 'assets/drizzle.png',
        colors: [
          Color(0xff6DFAE5),
          Color(0xff72EFEC),
        ],
      );
      break;
    case 313:
      return DataWeather(
        mainW: 'Drizzle',
        imgW: 'assets/drizzle.png',
        colors: [
          Color(0xff6DFAE5),
          Color(0xff72EFEC),
        ],
      );
      break;
    case 314:
      return DataWeather(
        mainW: 'Drizzle',
        imgW: 'assets/drizzle.png',
        colors: [
          Color(0xff6DFAE5),
          Color(0xff72EFEC),
        ],
      );
      break;
    case 321:
      return DataWeather(
        mainW: 'Drizzle',
        imgW: 'assets/drizzle.png',
        colors: [
          Color(0xff6DFAE5),
          Color(0xff72EFEC),
        ],
      );
      break;
    case 500:
      return DataWeather(
        mainW: 'Rain',
        imgW: 'assets/rain.png',
        colors: [
          Color(0xff6DFAE5),
          Color(0xff72EFEC),
        ],
      );
    case 501:
      return DataWeather(
        mainW: 'Rain',
        imgW: 'assets/rain.png',
        colors: [
          Color(0xff6DFAE5),
          Color(0xff72EFEC),
        ],
      );
    case 502:
      return DataWeather(
        mainW: 'Rain',
        imgW: 'assets/rain.png',
        colors: [
          Color(0xff6DFAE5),
          Color(0xff72EFEC),
        ],
      );
    case 503:
      return DataWeather(
        mainW: 'Rain',
        imgW: 'assets/rain.png',
        colors: [
          Color(0xff6DFAE5),
          Color(0xff72EFEC),
        ],
      );
    case 504:
      return DataWeather(
        mainW: 'Rain',
        imgW: 'assets/rain.png',
        colors: [
          Color(0xff6DFAE5),
          Color(0xff72EFEC),
        ],
      );
    case 511:
      return DataWeather(
        mainW: 'Rain',
        imgW: 'assets/rain.png',
        colors: [
          Color(0xff6DFAE5),
          Color(0xff72EFEC),
        ],
      );
    case 520:
      return DataWeather(
        mainW: 'Rain',
        imgW: 'assets/rain.png',
        colors: [
          Color(0xff6DFAE5),
          Color(0xff72EFEC),
        ],
      );
    case 521:
      return DataWeather(
        mainW: 'Rain',
        imgW: 'assets/rain.png',
        colors: [
          Color(0xff6DFAE5),
          Color(0xff72EFEC),
        ],
      );
    case 522:
      return DataWeather(
        mainW: 'Rain',
        imgW: 'assets/rain.png',
        colors: [
          Color(0xff6DFAE5),
          Color(0xff72EFEC),
        ],
      );
    case 531:
      return DataWeather(
        mainW: 'Rain',
        imgW: 'assets/rain.png',
        colors: [
          Color(0xff6DFAE5),
          Color(0xff72EFEC),
        ],
      );
    case 600:
      return DataWeather(
        mainW: 'Snow',
        imgW: 'assets/snow.png',
        colors: [
          Color(0xff8e9eab),
          Color(0xffeef2f3),
        ],
      );
    case 601:
      return DataWeather(
        mainW: 'Snow',
        imgW: 'assets/snow.png',
        colors: [
          Color(0xff8e9eab),
          Color(0xffeef2f3),
        ],
      );
    case 602:
      return DataWeather(
        mainW: 'Snow',
        imgW: 'assets/snow.png',
        colors: [
          Color(0xff8e9eab),
          Color(0xffeef2f3),
        ],
      );
    case 611:
      return DataWeather(
        mainW: 'Snow',
        imgW: 'assets/snow.png',
        colors: [
          Color(0xff8e9eab),
          Color(0xffeef2f3),
        ],
      );
    case 612:
      return DataWeather(
        mainW: 'Snow',
        imgW: 'assets/snow.png',
        colors: [
          Color(0xff8e9eab),
          Color(0xffeef2f3),
        ],
      );
    case 613:
      return DataWeather(
        mainW: 'Snow',
        imgW: 'assets/snow.png',
        colors: [
          Color(0xff8e9eab),
          Color(0xffeef2f3),
        ],
      );
    case 615:
      return DataWeather(
        mainW: 'Snow',
        imgW: 'assets/snow.png',
        colors: [
          Color(0xff8e9eab),
          Color(0xffeef2f3),
        ],
      );
    case 616:
      return DataWeather(
        mainW: 'Snow',
        imgW: 'assets/snow.png',
        colors: [
          Color(0xff8e9eab),
          Color(0xffeef2f3),
        ],
      );
    case 620:
      return DataWeather(
        mainW: 'Snow',
        imgW: 'assets/snow.png',
        colors: [
          Color(0xff8e9eab),
          Color(0xffeef2f3),
        ],
      );
    case 622:
      return DataWeather(
        mainW: 'Snow',
        imgW: 'assets/snow.png',
        colors: [
          Color(0xff8e9eab),
          Color(0xffeef2f3),
        ],
      );
    case 701:
      return DataWeather(
        mainW: 'Mist',
        imgW: 'assets/mist.png',
        colors: [
          Color(0xff8e9eab),
          Color(0xffeef2f3),
        ],
      );
    case 711:
      return DataWeather(
        mainW: 'Smoke',
        imgW: 'assets/mist.png',
        colors: [
          Color(0xff8e9eab),
          Color(0xffeef2f3),
        ],
      );
    case 721:
      return DataWeather(
        mainW: 'Haze',
        imgW: 'assets/mist.png',
        colors: [
          Color(0xff8e9eab),
          Color(0xffeef2f3),
        ],
      );
    case 731:
      return DataWeather(
        mainW: 'Dust',
        imgW: 'assets/mist.png',
        colors: [
          Color(0xff8e9eab),
          Color(0xffeef2f3),
        ],
      );
    case 741:
      return DataWeather(
        mainW: 'Fog',
        imgW: 'assets/mist.png',
        colors: [
          Color(0xff8e9eab),
          Color(0xffeef2f3),
        ],
      );
    case 751:
      return DataWeather(
        mainW: 'Sand',
        imgW: 'assets/mist.png',
        colors: [
          Color(0xff8e9eab),
          Color(0xffeef2f3),
        ],
      );
    case 761:
      return DataWeather(
        mainW: 'Dust',
        imgW: 'assets/mist.png',
        colors: [
          Color(0xff8e9eab),
          Color(0xffeef2f3),
        ],
      );
    case 762:
      return DataWeather(
        mainW: 'Ash',
        imgW: 'assets/mist.png',
        colors: [
          Color(0xff8e9eab),
          Color(0xffeef2f3),
        ],
      );
    case 771:
      return DataWeather(
        mainW: 'Squall',
        imgW: 'assets/mist.png',
        colors: [
          Color(0xff8e9eab),
          Color(0xffeef2f3),
        ],
      );
      break;
    case 781:
      return DataWeather(
        mainW: 'Tornado',
        imgW: 'assets/mist.png',
        colors: [
          Color(0xff8e9eab),
          Color(0xffeef2f3),
        ],
      );
      break;
    case 800:
      return DataWeather(
        mainW: 'Clear',
        imgW: 'assets/clear.png',
        colors: [
          Color(0xffFAE177),
          Color(0xffFABE94),
        ],
      );
    case 801:
      return DataWeather(
        mainW: 'Clouds',
        imgW: 'assets/clouds.png',
        colors: [
          Color(0xff6DFAE5),
          Color(0xff72EFEC),
        ],
      );
      break;
    case 802:
      return DataWeather(
        mainW: 'Clouds',
        imgW: 'assets/clouds.png',
        colors: [
          Color(0xff6DFAE5),
          Color(0xff72EFEC),
        ],
      );
      break;
    case 803:
      return DataWeather(
        mainW: 'Clouds',
        imgW: 'assets/clouds.png',
        colors: [
          Color(0xff6DFAE5),
          Color(0xff72EFEC),
        ],
      );
      break;
    case 804:
      return DataWeather(
        mainW: 'Clouds',
        imgW: 'assets/clouds.png',
        colors: [
          Color(0xff6DFAE5),
          Color(0xff72EFEC),
        ],
      );
      break;
    default:
      return DataWeather(
        mainW: '? UwU',
        imgW: 'assets/question.png',
        colors: [
          Color(0xff283048),
          Color(0xff859398),
        ],
      );
  }
}
