import 'package:weather/weather/data/data_provider/Api/weather_api.dart';

import '../models/weather.dart';

class WeatherRepository {
  final weatherApi = WeatherApi();

  Future<Weather> getWeatherForLocation(String city) async {
    final rawresponseWeather = await weatherApi.getWeather(city);
    final weather = Weather.fromJson(rawresponseWeather);
    //Fine Tune the data here
    return weather;
  }

  Future<Weather> getCurrentLocationWeather() async {
    final rawresponseWeather = await weatherApi.getCurrentLocationWeather();
    final weather = Weather.fromJson(rawresponseWeather);
    //Fine Tune the data here
    return weather;
  }
}
