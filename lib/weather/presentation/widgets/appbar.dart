import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/weather_bloc.dart';

AppBar buildAppBar(TextEditingController controller, BuildContext context) {
  return AppBar(
    toolbarHeight: 70,
    elevation: 1,
    backgroundColor: Colors.white,
    shadowColor: Colors.grey.withOpacity(0.5),
    title: Container(
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
  );
}
