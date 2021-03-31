import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/provider/weather_provider.dart';

class DaysWidget extends StatefulWidget {
  const DaysWidget({
    Key key,
  }) : super(key: key);

  @override
  _DaysWidgetState createState() => _DaysWidgetState();
}

class _DaysWidgetState extends State<DaysWidget> with TickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var weatherData = Provider.of<WeatherProvider>(context);

    return Container(
      height: 30,
      child: TabBar(
        isScrollable: true,
        controller: TabController(
          length: weatherData.getweatherResponse.daily.length,
          vsync: this,
        ),
        indicatorWeight: 0.1,
        labelColor: Colors.black,
        unselectedLabelColor: Colors.black.withOpacity(0.3),
        tabs: List.generate(
          weatherData.getweatherResponse.daily.length,
          (index) => TabItemWidget(
            data: weatherData.getweatherResponse.daily[index],
          ),
        ),
      ),
    );
  }
}

class TabItemWidget extends StatelessWidget {
  const TabItemWidget({
    Key key,
    this.data,
  }) : super(key: key);

  final Daily data;

  @override
  Widget build(BuildContext context) {
    var dayName = DateFormat('EEEE').format(
      DateTime.fromMillisecondsSinceEpoch(
        data.dt * 1000,
      ),
    );
    var dayNum = DateFormat('d').format(
      DateTime.fromMillisecondsSinceEpoch(
        data.dt * 1000,
      ),
    );
    var monthName = DateFormat('MMMM').format(
      DateTime.fromMillisecondsSinceEpoch(
        data.dt * 1000,
      ),
    );

    return Container(
      height: 26,
      alignment: Alignment.center,
      child: Text(
        '$dayName, $dayNum $monthName',
      ),
    );
  }
}
