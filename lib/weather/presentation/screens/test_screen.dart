import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather/weather/presentation/widgets/weather_card.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: WeatherCard(),
      ),
    );
  }
}
