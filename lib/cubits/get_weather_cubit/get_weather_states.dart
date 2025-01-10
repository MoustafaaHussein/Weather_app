import 'package:weatherapp2/Models/WeatherModel.dart';

class initialState extends WeatherStates {}

class FailuareState extends WeatherStates {}

class WeatherLoadedState extends WeatherStates {
  final weather_model weatherModels;

  WeatherLoadedState({required this.weatherModels});
}

class WeatherStates {}
