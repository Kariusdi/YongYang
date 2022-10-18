import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:yongyang/model/weather_model.dart';

class WeatherApiClient {
  Future<Weather> getCurrentWeather(String location) async {
    try {
      final uri = Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=e5e3222db5c749f576c8bc00e4f5f03b');
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        //means success
        return Weather.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Can not get weather");
      }
    } catch (e) {
      rethrow;
    }
  }
}
