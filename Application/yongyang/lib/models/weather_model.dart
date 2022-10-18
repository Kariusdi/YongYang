class Weather {
  final double temperature;
  final double feelsLike;
  final double humidity;
  final int pressure;

  Weather({
    this.temperature = 0,
    this.feelsLike = 0,
    this.humidity = 0,
    this.pressure = 0,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temperature: json["main"]["temp"],
      feelsLike: json["main"]["feels_like"],
      humidity: json["main"]["humidity"],
      pressure: json["main"]["pressure"],
    );
  }
}
