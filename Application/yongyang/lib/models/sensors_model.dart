class Sensors {
  final double temperature;
  final double humidity;

  Sensors({this.temperature = 0.0, this.humidity = 0.0});

  factory Sensors.fromJson(Map<dynamic, dynamic> json) {
    double parser(dynamic source) {
      try {
        return double.parse(source.toString());
      } on FormatException {
        return -1;
      }
    }

    return Sensors(
      temperature: parser(json['Temp']),
      humidity: parser(json['Humi']),
    );
  }
}
