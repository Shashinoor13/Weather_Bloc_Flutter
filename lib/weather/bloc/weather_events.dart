part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class GetWeather extends WeatherEvent {
  const GetWeather({required this.cityName});

  final String cityName;

  @override
  List<Object> get props => [cityName];
}

class GetWeatherSuccess extends WeatherEvent {
  const GetWeatherSuccess({required this.weather});

  final Weather weather;
  @override
  List<Object> get props => [weather];
}

class LoadInitialWeather extends WeatherEvent {
  const LoadInitialWeather();

  @override
  List<Object> get props => [];
}
