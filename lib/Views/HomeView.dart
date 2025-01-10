// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp2/Views/InfoView.dart';
import 'package:weatherapp2/Views/SearchView.dart';
import 'package:weatherapp2/Widgets/NoWeatherWidget.dart';
import 'package:weatherapp2/cubits/get_weather_cubit.dart';
import 'package:weatherapp2/cubits/get_weather_cubit/get_weather_states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const SearchView();
                  }),
                );
              },
              icon: const Icon(
                Icons.search_rounded,
                size: 25,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherStates>(
          builder: (context, state) {
        if (state is initialState) {
          return Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue,
                    Colors.blueAccent,
                    Colors.white,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: const NoWeatherView());
        } else if (state is WeatherLoadedState) {
          return WeatherInfoView(
            weather: state.weatherModels,
          );
        } else {
          return const Text('OOPs Error occured');
        }
      }),
    );
  }
}
