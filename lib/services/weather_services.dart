import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weatherapp2/Models/WeatherModel.dart';

class WeatherServices {
  final Dio dio;
  String apiKey = 'key=ef3ab538d1634dfcb00234232240412';
  String baseUrl = 'http://api.weatherapi.com/v1';
  WeatherServices(this.dio);
  Future<weather_model> getCurrentWeather({required String cityName}) async {
    try {
      Response response =
          await dio.get('$baseUrl/forecast.json?$apiKey&q=$cityName&days=1');
      weather_model weathermodel = weather_model.fromjson(response.data);
      return weathermodel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'oops Error found please try again later';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('oops there was an error try later');
    }
  }
}
