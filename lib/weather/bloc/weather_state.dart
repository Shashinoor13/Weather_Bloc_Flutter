part of 'weather_bloc.dart';

enum WeatherStatus { initial, loading, success, failure }

class WeatherState extends Equatable {
  const WeatherState({
    this.weather,
    required this.status,
    this.error,
  });
  final Weather? weather;
  final WeatherStatus status;
  final String? error;

  @override
  List<Object?> get props => [weather, status, error];

  WeatherState copyWith({
    Weather? weather,
    WeatherStatus? status,
    String? error,
  }) {
    return WeatherState(
      weather: weather ?? this.weather,
      status: status ?? this.status,
      error: error,
    );
  }
}

class WeatherInitial extends WeatherState {
  const WeatherInitial() : super(status: WeatherStatus.initial);

  @override
  List<Object?> get props => [];
}

class WeatherLoading extends WeatherState {
  const WeatherLoading() : super(status: WeatherStatus.loading);

  @override
  List<Object?> get props => [];
}

class WeatherLoaded extends WeatherState {
  const WeatherLoaded()
      : super(
          status: WeatherStatus.success,
        );

  @override
  List<Object?> get props => [status, weather];
}

class WeatherError extends WeatherState {
  const WeatherError() : super(status: WeatherStatus.failure);

  @override
  List<Object?> get props => [error, status];
}
