import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/weather_provider.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    Key key,
    @required this.mainW,
    @required this.imgW,
  }) : super(key: key);

  final String mainW;
  final String imgW;

  @override
  Widget build(BuildContext context) {
    var weatherData = Provider.of<WeatherProvider>(context);

    return Container(
      height: 260,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(bottom: 10),
                child: Image(
                  image: AssetImage(imgW),
                ),
              ),
            ),
            SizedBox(height: 5),
            Text(
              mainW,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xff06070B),
              ),
            ),
            SizedBox(height: 5),
            Text(
              ' ${weatherData.getweatherResponse.current.temp.toInt()}°',
              style: TextStyle(
                fontSize: 58,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    FaIcon(FontAwesomeIcons.wind, size: 16),
                    SizedBox(width: 5),
                    Text(
                      '${weatherData.getweatherResponse.current.windSpeed.toInt().toString()} km/h',
                    ),
                  ],
                ),
                SizedBox(width: 20),
                Row(
                  children: [
                    FaIcon(FontAwesomeIcons.tint, size: 16),
                    SizedBox(width: 5),
                    Text(
                      '${weatherData.getweatherResponse.current.humidity.toInt().toString()} %',
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
