import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/weather_provider.dart';

class HoursWidget extends StatelessWidget {
  const HoursWidget({
    Key key,
    @required this.animation,
  }) : super(key: key);

  final double animation;

  @override
  Widget build(BuildContext context) {
    var weatherData = Provider.of<WeatherProvider>(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      height: 180,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: weatherData.getweatherResponse.daily.length,
        itemBuilder: (BuildContext context, int index) {
          var hour = DateFormat('jm').format(
            DateTime.fromMillisecondsSinceEpoch(
              weatherData.getweatherResponse.hourly[index].dt * 1000,
            ),
          );
          return Transform.translate(
            offset: Offset(
              0.0,
              animation * (index + 1),
            ),
            child: Container(
              margin: EdgeInsets.only(right: 15),
              width: 120,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    hour,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Icon(Icons.wb_sunny),
                  Text(
                    ' ${weatherData.getweatherResponse.hourly[index].temp.toInt()}°',
                    style: TextStyle(
                      fontSize: 26,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
