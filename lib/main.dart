// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:weather_app/model/city.dart';
import 'package:weather_app/model/cityData.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/screens/HomeBody.dart';
import 'package:weather_app/screens/get_more_screen.dart';

import 'screens/favorites_city_screen.dart';
import 'services/weather_api_c.dart';
import 'package:provider/provider.dart';

import 'services/weather_api_client_3h.dart';

void main() {
  //runApp(const MyApp());
  runApp(ChangeNotifierProvider(
    create: (context) => CityData(),
    builder: (context, _) => MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 0;

  WeatherApiClient3h cl = WeatherApiClient3h();

  final controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CityData(),
      child: MaterialApp(
        home: PageView(
          controller: controller,
          children: [
            HomeBody(),
            FavoriteCityScreen(
              i: index,
            ),
            FavoriteCityScreen(
              i: 1,
            ),
          ],
        ),
      ),
    );
  }
}
//HomeBody(),
//FavoriteCityScreen(),
/**PageView.builder(
        itemCount: Provider.of<CityData>(context).favoriteWeather.length,
        itemBuilder: ((context, index) {
          return FavoriteCityScreen(
            i: index,
          );
        }),
      ) */

      /**PageView(
          children: [
            HomeBody(),
            PageView.builder(
              itemCount: 4,
              itemBuilder: ((context, index) {
                return FavoriteCityScreen(
                  i: index,
                );
              }),
            )
          ],
        ), */

        /**PageView(
          controller: controller,
          children: [
            HomeBody(),
            FavoriteCityScreen(
              i: index,
            ),
            FavoriteCityScreen(
              i: 1,
            ),
          ],
        ), */

        /**ChangeNotifierProvider(
      create: (context) => CityData(),
      child: MaterialApp(
        home: PageView(
          controller: controller,
          children: [
            HomeBody(),
            FavoriteCityScreen(
              i: index,
            ),
            FavoriteCityScreen(
              i: 1,
            ),
          ],
        ),
      ),
    ); */