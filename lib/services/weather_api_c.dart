import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/model/cityData.dart';
import '../model/weather_model.dart';

class WeatherApiC {
  var sunRise1;
  var sunSet1;
  Future<Weather>? getCurrentWeather(String? location) async {
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&units=metric&appid=4ae976d0780442bc4495912e4c4663ba");

    var reponse = await http.get(endpoint);
    var body = jsonDecode(reponse.body);

    //for Sun Rise
    var sunrise = body["sys"]["sunrise"];
    var formatSunRise = DateTime.fromMillisecondsSinceEpoch(sunrise * 1000);
    var formatSunRiseEnd = formatSunRise.add(Duration(hours: 1));
    print("$formatSunRiseEnd");
    sunRise1 = formatSunRiseEnd;

    //For sunset
    var sunset = body["sys"]["sunset"];
    var formatSunset = DateTime.fromMillisecondsSinceEpoch(sunset * 1000);
    var formatSunsetEnd = formatSunset.add(Duration(hours: 1));
    print("$formatSunsetEnd");
    sunSet1 = formatSunsetEnd;

    return Weather.fromJson(body);
  }
}
