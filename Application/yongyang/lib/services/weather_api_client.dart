import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:yongyang/model/weather_model.dart';

class WeatherApiClient {
  Future<Weather>? getCurrentWeather(String? location) async {
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=e5e3222db5c749f576c8bc00e4f5f03b&units=metric");
    var resposne = await http.get(endpoint);
    var body = jsonDecode(resposne.body);
    print(Weather.fromJson(body));
    return Weather.fromJson(body);
  }
}
