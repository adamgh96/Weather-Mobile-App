import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_model_3h.dart';

class WeatherApiClient3h {
  Future<Weather3h>? getFutureWeather(String? location) async {
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/forecast?q=$location&units=metric&appid=4ae976d0780442bc4495912e4c4663ba&cnt=9");

    var reponse = await http.get(endpoint);
    var body = jsonDecode(reponse.body);
    //print(Weather3h.fromJson(body).cityName);
    //print(Weather3h.fromJson(body).temp);
    return Weather3h.fromJson(body);
  }
}
