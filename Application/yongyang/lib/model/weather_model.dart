class Weather {
  double? temperature;
  double? feelsLike;
  int? humidity;
  int? pressure;

  Weather({this.temperature, this.feelsLike, this.humidity, this.pressure});

  Weather.fromJson(Map<String, dynamic> json) {
    temperature = json["main"]["temp"];
    feelsLike = json["main"]["feels_like"];
    humidity = json["main"]["humidity"];
    pressure = json["main"]["pressure"];
  }
}
