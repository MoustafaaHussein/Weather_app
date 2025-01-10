import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp2/Models/WeatherModel.dart';
import 'package:weatherapp2/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weatherapp2/services/weather_services.dart';

class GetWeatherCubit extends Cubit<WeatherStates> {
  GetWeatherCubit() : super(initialState());
  weather_model? modelObject;
  getWeather({required String cityName}) async {
    try {
      modelObject =
          await WeatherServices(Dio()).getCurrentWeather(cityName: cityName);
      emit(WeatherLoadedState(weatherModels: modelObject!));
    } catch (e) {
      emit(FailuareState());
    }
  }
}
