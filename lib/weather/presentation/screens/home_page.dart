import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/weather_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<WeatherBloc>().add(const LoadInitialWeather());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              hintText: 'Enter a city',
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.search),
            ),
            onSubmitted: (value) {
              context.read<WeatherBloc>().add(GetWeather(cityName: value));
            },
          ),
          BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state.status == WeatherStatus.success) {
                return Text(state.weather!.temperatureCelsius!.toString());
              } else if (state.status == WeatherStatus.failure) {
                return Text(state.error!);
              }
              if (state.status == WeatherStatus.loading) {
                return const CircularProgressIndicator();
              } else {
                return const Text('Please select a location');
              }
            },
          ),
        ],
      ),
    );
  }
}
