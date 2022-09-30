// ignore_for_file: unnecessary_string_interpolations, unrelated_type_equality_checks, non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/cupertino.dart';
import 'package:weather_app/model/weather_model_3h.dart';

import 'cityData.dart';
import 'package:provider/provider.dart';

class FavoriteCity {
  /*List<String> favoriteWeather = [];
  List<Weather3h> favoriteWeather3h = [];

  void addCity(String newCity) {
    favoriteWeather.add(newCity);
  }

  void managerFavorite(CityData cityName) {
    final exestingCity =
        favoriteWeather.indexWhere((CityData) => CityData.cityName == cityName);
    if (exestingCity >= 0) {
      favoriteWeather.removeAt(exestingCity);
    } else {
      favoriteWeather.add(cityName);
    }
  }*/
  final String cityName;

  FavoriteCity({required this.cityName});
}
