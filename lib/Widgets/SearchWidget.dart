import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp2/cubits/get_weather_cubit.dart';

class Searchwidget extends StatelessWidget {
  const Searchwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
          child: TextField(
        onSubmitted: (cityName) async {
          var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
          getWeatherCubit.getWeather(cityName: cityName);
          Navigator.pop(context);
        },
        showCursor: true,
        textCapitalization: TextCapitalization.words,
        cursorColor: Colors.red,
        decoration: InputDecoration(
          suffixIcon: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          labelText: 'City Name',
          hintText: 'Enter City Name',
          hintStyle: const TextStyle(
            fontStyle: FontStyle.italic,
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: Colors.red,
              )),
        ),
      )),
    );
  }
}
