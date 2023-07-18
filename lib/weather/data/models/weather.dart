class Weather {
  final String? cityName;
  final double? temperatureCelsius;
  final double? feelsLike;
  final String? description;
  final double? humidity;
  final double? pressure;
  final double? windSpeed;
  final double? maxTemp;
  final double? minTemp;

  Weather(
      this.cityName,
      this.temperatureCelsius,
      this.description,
      this.humidity,
      this.pressure,
      this.windSpeed,
      this.maxTemp,
      this.minTemp,
      this.feelsLike);

  factory Weather.fromJson(Map<String, dynamic> json) {
    final cityName = json['name'];
    final temperatureCelsius = json['main']['temp'].toDouble();
    final feelsLike = json['main']['feels_like'].toDouble();
    final description = json['weather'][0]['description'];
    final humidity = json['main']['humidity'].toDouble();
    final pressure = json['main']['pressure'].toDouble();
    final windSpeed = json['wind']['speed'].toDouble();
    final maxTemp = json['main']['temp_max'].toDouble();
    final minTemp = json['main']['temp_min'].toDouble();

    return Weather(cityName, temperatureCelsius, description, humidity,
        pressure, windSpeed, maxTemp, minTemp, feelsLike);
  }
}
