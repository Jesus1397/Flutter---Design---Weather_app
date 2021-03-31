import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/location_model.dart';
import 'package:weather_app/provider/location_provider.dart';
import 'package:weather_app/utils/db_locations.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({
    Key key,
    this.controller,
  }) : super(key: key);
  final AnimationController controller;
  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String dropdownValue = 'Buenos Aires';

  @override
  Widget build(BuildContext context) {
    List<String> locationNames = [];
    locations.forEach((Location element) {
      locationNames.add(element.name);
    });

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Row(
        children: [
          Icon(Icons.location_on),
          SizedBox(width: 15),
          DropdownButton(
            items: <String>[...locationNames]
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            value: dropdownValue,
            icon: Icon(Icons.keyboard_arrow_down_rounded),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
              });

              locations.forEach(
                (Location element) {
                  if (element.name == newValue) {
                    Provider.of<LocationProvider>(context, listen: false)
                        .setLocation = element;

                    // widget.controller.reset();
                    // widget.controller.forward();
                  }
                },
              );
            },
          ),
          Spacer(),
          Icon(Icons.calendar_today),
        ],
      ),
    );
  }
}
