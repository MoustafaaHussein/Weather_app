import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp2/Models/WeatherModel.dart';
import 'package:weatherapp2/Widgets/textWidget.dart';
import 'package:weatherapp2/cubits/get_weather_cubit.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    super.key,
    required this.weather,
  });
  final weather_model weather;
  @override
  Widget build(BuildContext context) {
    var modelObjects = BlocProvider.of<GetWeatherCubit>(context).modelObject!;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Textwidget(
              data: modelObjects.cityName,
              textColor: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network('https:${modelObjects.image!}'),
                const Spacer(
                  flex: 1,
                ),
                Textwidget(
                    data: modelObjects.temp.toString(),
                    textColor: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                const Spacer(flex: 1),
                Column(
                  children: [
                    Textwidget(
                        data: 'Max Temp: ${modelObjects.maxTemp.toString()}',
                        textColor: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                    Textwidget(
                        data: 'Min Temp: ${modelObjects.minTemp.toString()}',
                        textColor: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ],
                ),
              ],
            ),
          ),
          Textwidget(
              data: modelObjects.condition,
              textColor: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ],
      ),
    );
  }
}
