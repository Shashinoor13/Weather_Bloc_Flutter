// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/icon_map.dart';
import 'package:weather/weather/data/models/weather.dart';
import '../../bloc/weather_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    context.read<WeatherBloc>().add(const LoadInitialWeather());
    return Scaffold(
      // appBar: buildAppBar(controller, context),
      body: Stack(
        children: [
          //Compare Time and Show the Background Accordingly
          background(context),
          SafeArea(
            child: Column(
              children: [
                //Search Bar
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: SearchBar(
                    backgroundColor: SearchBarTheme.of(context).backgroundColor,
                    hintText: 'Search for a city',
                    controller: controller,
                    trailing: [
                      IconButton(
                        onPressed: () {
                          context.read<WeatherBloc>().add(
                                GetWeather(
                                  cityName: controller.text,
                                ),
                              );
                        },
                        icon: const Icon(Icons.search),
                      ),
                    ],
                  ),
                ),
                //Weather Details
                BlocBuilder<WeatherBloc, WeatherState>(
                  builder: (context, state) {
                    if (state.status == WeatherStatus.success) {
                      return WeatherDetails(
                        weather: state.weather,
                      );
                    } else if (state.status == WeatherStatus.failure) {
                      return Text(
                        state.error!,
                        style: const TextStyle(color: Colors.red),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Image background(BuildContext context) {
    final time = DateTime.now().hour;
    if (time > 5 && time <= 9) {
      return Image(
        image: const AssetImage(
          'assets/images/sunrise.png',
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      );
    }
    if (time > 9 && time <= 18) {
      return Image(
        image: const AssetImage(
          'assets/images/day.png',
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      );
    }
    if (time > 18 && time <= 5) {
      return Image(
        image: const AssetImage(
          'assets/images/night.png',
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      );
    } else {
      return Image(
        image: const AssetImage(
          'assets/images/day.png',
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      );
    }
  }

  Widget WeatherDetails({Weather? weather}) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.location_on, color: Colors.white),
              Text(
                weather!.cityName!,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const Icon(Icons.abc
              // weather.getIconData(),
              ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${weather.temperatureCelsius!.toStringAsFixed(1)} °C',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 60,
                  fontWeight: FontWeight.w800,
                ),
              ),
              RotatedBox(
                quarterTurns: 3,
                child: Text(
                  'Feels Like ${weather.feelsLike!.toStringAsFixed(1)} °C',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          Text(
            weather.description!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
