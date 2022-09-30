import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/model/city.dart';

import 'favorite_city.dart';

class CityData extends ChangeNotifier {
  //City newCity = City(cityName: "monastir");
  String cityName = "italy";
  List<String> favoriteWeather = [];
  bool isExist = false;

  void addCity(String cName) {
    cityName = cName;
    notifyListeners();
  }

  void addCityToFavortie(String newCity) {
    favoriteWeather.add(newCity);

    notifyListeners();
  }

  bool isSet(String name) {
    return favoriteWeather.contains(name);
  }

  bool setData() {
    return favoriteWeather.isEmpty;
  }
}
