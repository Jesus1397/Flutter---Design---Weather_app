import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/provider/location_provider.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/widgets/days_widget.dart';
import 'package:weather_app/widgets/header_widget.dart';
import 'package:weather_app/widgets/hours_widget.dart';
import 'package:weather_app/widgets/info_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> leftToRight;
  Animation<double> botToTop;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 4000),
    );

    leftToRight = Tween(begin: 300.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 1.0, curve: Curves.bounceOut),
      ),
    );
    botToTop = Tween(begin: 100.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 1.0, curve: Curves.bounceOut),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var locationData = Provider.of<LocationProvider>(context);
    var weatherData = Provider.of<WeatherProvider>(
      context,
      listen: false,
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Container(
            width: size.width,
            height: size.height,
            child: Center(
              child: FutureBuilder<WeatherResponse>(
                future: weatherData.getData(
                  locationData.getLocation.lat,
                  locationData.getLocation.lon,
                ),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData &&
                      snapshot.data != null) {
                    _animationController.forward();
                    DataWeather dataWeather = getDataWeather(
                      weatherData.getweatherResponse.current.weather[0].id,
                    );
                    return AnimatedContainer(
                      width: size.width,
                      height: size.height,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: weatherData.getweatherBackG,
                        ),
                      ),
                      duration: Duration(milliseconds: 500),
                      child: AnimatedBuilder(
                        animation: _animationController,
                        builder: (
                          BuildContext context,
                          Widget child,
                        ) {
                          return Column(
                            children: [
                              HeaderWidget(
                                controller: _animationController,
                              ),
                              SizedBox(height: 20),
                              Transform.translate(
                                offset: Offset(
                                  leftToRight.value,
                                  0.0,
                                ),
                                child: InfoWidget(
                                  mainW: dataWeather.mainW,
                                  imgW: dataWeather.imgW,
                                ),
                              ),
                              SizedBox(height: 30),
                              DaysWidget(),
                              SizedBox(height: 10),
                              HoursWidget(
                                animation: botToTop.value,
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  }

                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
