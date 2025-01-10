import 'package:flutter/material.dart';
import 'package:weatherapp2/Widgets/textWidget.dart';

class NoWeatherView extends StatelessWidget {
  const NoWeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Textwidget(
              data: 'No result found please try different city',
              textColor: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ],
      ),
    );
  }
}
