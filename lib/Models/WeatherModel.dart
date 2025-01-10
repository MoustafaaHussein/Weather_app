class weather_model {
  final String cityName;
  final double maxTemp;
  final double minTemp;
  final String updateTime;
  final String? image;
  final String condition;
  final double temp;
  weather_model(
      {required this.cityName,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.updateTime,
      this.image,
      required this.condition});
  factory weather_model.fromjson(json) {
    return weather_model(
        image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
        cityName: json['location']['name'],
        maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        updateTime: json['current']['last_updated'],
        condition: json['forecast']['forecastday'][0]['day']['condition']
            ['text'],
        temp: json['forecast']['forecastday'][0]['day']['avgtemp_c']);
  }
}
