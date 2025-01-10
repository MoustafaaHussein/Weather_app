import 'package:flutter/material.dart';
import 'package:weatherapp2/Models/WeatherModel.dart';
import 'package:weatherapp2/Widgets/InfoWidget.dart';
import 'package:weatherapp2/main.dart';

class WeatherInfoView extends StatelessWidget {
  const WeatherInfoView({
    super.key,
    required this.weather,
  });

  final weather_model weather;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          getThemeColor(weather.condition),
          getThemeColor(weather.condition)[300]!,
          getThemeColor(weather.condition)[50]!,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
      child: InfoWidget(
        weather: weather,
      ),
    ));
  }
}
