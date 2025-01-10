import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp2/Views/HomeView.dart';
import 'package:weatherapp2/cubits/get_weather_cubit.dart';
import 'package:weatherapp2/cubits/get_weather_cubit/get_weather_states.dart';

void main() {
  runApp(const weatherapp());
}

class weatherapp extends StatelessWidget {
  const weatherapp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<GetWeatherCubit, WeatherStates>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                appBarTheme: AppBarTheme(
                  backgroundColor: getThemeColor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .modelObject
                        ?.condition,
                  ),
                ),
                /*  primarySwatch: getThemeColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .modelObject
                      ?.condition,
                ), */
              ),
              debugShowCheckedModeBanner: false,
              home: HomeScreen(),
            );
          },
        );
      }),
    );
  }
}

MaterialColor getThemeColor(String? timeOfDay) {
  switch (timeOfDay) {
    case "Sunny":
    case "Clear":
      return Colors.yellow; // Sunny or Clear
    case "Partly cloudy":
    case "Cloudy":
    case "Overcast":
      return Colors.grey; // Cloudy, Partly Cloudy, Overcast
    case "Mist":
      return Colors.lightBlue; // Mist
    case "Patchy rain possible":
    case "Light drizzle":
    case "Moderate rain":
    case "Heavy rain":
      return Colors.blue; // Rain-related conditions
    case "Patchy snow possible":
    case "Blowing snow":
    case "Patchy moderate snow":
    case "Moderate snow":
    case "Patchy heavy snow":
    case "Heavy snow":
      return Colors.grey; // Snow
    case "Freezing drizzle":
    case "Heavy freezing drizzle":
    case "Light sleet":
    case "Moderate or heavy sleet":
    case "Patchy light snow":
    case "Patchy light snow with thunder":
    case "Moderate or heavy snow":
    case "Moderate or heavy snow with thunder":
      return Colors.cyan; // Sleet and Snow
    case "Patchy light rain with thunder":
    case "Moderate or heavy rain with thunder":
    case "Patchy light snow with thunder":
    case "Moderate or heavy snow with thunder":
      return Colors.deepPurple; // Thunderstorms
    default:
      return Colors.blue; // Default color for unknown conditions
  }
}
