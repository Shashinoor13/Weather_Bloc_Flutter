import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/weather/data/repository/weather_repository.dart';

import '../data/models/weather.dart';

part 'weather_events.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc()
      : super(const WeatherState(
          status: WeatherStatus.initial,
        )) {
    on<LoadInitialWeather>(_onLoadInitialWeather);
    on<GetWeather>(_onGetWeather);
  }

  FutureOr<void> _onGetWeather(
      GetWeather event, Emitter<WeatherState> emit) async {
    emit(const WeatherState(status: WeatherStatus.loading));
    try {
      final weather =
          await WeatherRepository().getWeatherForLocation(event.cityName);
      emit(WeatherState(
        weather: weather,
        status: WeatherStatus.success,
      ));
    } on Exception catch (e) {
      if (e.toString().contains('404')) {
        emit(const WeatherState(
          status: WeatherStatus.failure,
          error: 'City not found',
        ));
      } else {
        emit(WeatherState(
          status: WeatherStatus.failure,
          error: e.toString(),
        ));
      }
    }
  }

  FutureOr<void> _onLoadInitialWeather(
      LoadInitialWeather event, Emitter<WeatherState> emit) async {
    emit(const WeatherState(status: WeatherStatus.loading));
    try {
      final weather = await WeatherRepository().getCurrentLocationWeather();
      emit(WeatherState(
        weather: weather,
        status: WeatherStatus.success,
      ));
    } on Exception catch (e) {
      if (e.toString().contains('404')) {
        emit(const WeatherState(
          status: WeatherStatus.failure,
          error: 'City not found',
        ));
      } else {
        emit(WeatherState(
          status: WeatherStatus.failure,
          error: e.toString(),
        ));
      }
    }
  }
}
