import 'package:dio/dio.dart';
import 'package:weather/weather/data/data_provider/Api/current_location_api.dart';

import '../../../../core/constants/constants.dart';

class WeatherApi {
  Future getWeather(String cityName) async {
    const key = apiKey;
    final dio = Dio();
    final response = await dio.get(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$key');
    dio.close();
    return response.data;
  }

  Future getCurrentLocationWeather() async {
    final position = await determinePosition();
    const key = apiKey;
    final dio = Dio();
    final response = await dio.get(
        'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=$key');
    dio.close();
    return response.data;
  }
}
