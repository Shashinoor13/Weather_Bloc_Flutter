import 'dart:async';

import 'package:dio/dio.dart';
import 'package:weather/core/constants/constants.dart';

class LatLongApi {
  Future getLatLong(String cityName) async {
    const key = apiKey;
    final dio = Dio();
    final response = await dio.get(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$key');
    return response.data;
  }
}
