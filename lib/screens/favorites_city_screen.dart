// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:weather_app/model/cityData.dart';
import 'package:weather_app/screens/HomeBody.dart';

import '../main.dart';
import '../model/weather_model.dart';
import '../services/weather_api_c.dart';
import '../widgets/future-container.dart';
import '../widgets/future-favorites-container.dart';
import 'addCity.dart';
import 'get_more_screen.dart';

class FavoriteCityScreen extends StatefulWidget {
  final int i;

  //FavoriteCityScreen({required this.i});
  const FavoriteCityScreen({
    Key? key,
    required this.i,
  }) : super(key: key);

  @override
  State<FavoriteCityScreen> createState() => _FavoriteCityScreenState();
}

class _FavoriteCityScreenState extends State<FavoriteCityScreen> {
  WeatherApiC client = WeatherApiC();

  Weather? data;

  @override
  Widget build(BuildContext context) {
    Future<void> getData() async {
      data = await client.getCurrentWeather(
          "${Provider.of<CityData>(context).favoriteWeather[widget.i]}");
    }

    // this Function for adding favorite name fo city in the list of favorties
    void manageFavoriteList() {
      if (Provider.of<CityData>(context, listen: false)
              .isSet(Provider.of<CityData>(context, listen: false).cityName) ==
          true) {
        setState(() {
          Provider.of<CityData>(context, listen: false)
              .favoriteWeather
              .remove(Provider.of<CityData>(context, listen: false).cityName);
          Provider.of<CityData>(context, listen: false).isExist = false;
        });
      } else {
        setState(
          () {
            Provider.of<CityData>(context, listen: false).addCityToFavortie(
                "${Provider.of<CityData>(context, listen: false).cityName}");
            Provider.of<CityData>(context, listen: false).isExist = true;
          },
        );
      }

      print("${Provider.of<CityData>(context, listen: false).favoriteWeather}");
    }

    if (Provider.of<CityData>(context)
        .favoriteWeather
        .asMap()
        .containsKey(widget.i)) {
      return Scaffold(
        backgroundColor: HexColor("#6dfae5"),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 30,
                            ),
                            Text(
                              //City Name
                              "${Provider.of<CityData>(context).favoriteWeather[widget.i]}",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 230,
                            ),
                          ],
                        ),
                        Image.asset(
                          "images/image1r.png",
                          height: 150,
                          width: 200,
                        ),

                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "${data!.description}",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "${data!.temp}°",
                          style: TextStyle(
                              fontSize: 70,
                              fontWeight: FontWeight.bold,
                              color: data!.temp! > 30
                                  ? Colors.red[900]
                                  : Colors.blue[900]),
                        ),
                        //ss
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    width: 170,
                                  ),
                                  Text(
                                    " ${data!.temp_min}° / ${data!.temp_max}°",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color:
                                            Color.fromARGB(198, 103, 102, 102),
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        //ss
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Icon(Icons.air),
                                  Text(
                                    "${data!.wind} Km/h",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Icon(Icons.egg_outlined),
                                  Text("${data!.humidity}%",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500))
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 90),
                          child: Divider(
                            color: Colors.black,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    GetMore(data: data, sun: client),
                              ),
                            );
                          },
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Get more",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(110, 158, 158, 158),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          height: 200,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              HoureFavoriteContainer(
                                i: widget.i,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              HoureFavoriteContainer(
                                i: widget.i,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              HoureFavoriteContainer(
                                i: widget.i,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              HoureFavoriteContainer(
                                i: widget.i,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              HoureFavoriteContainer(
                                i: widget.i,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              HoureFavoriteContainer(
                                i: widget.i,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              HoureFavoriteContainer(
                                i: widget.i,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              HoureFavoriteContainer(
                                i: widget.i,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              HoureFavoriteContainer(
                                i: widget.i,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return Container();
              },
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Provider.of<CityData>(context, listen: false).isExist
              ? Icons.star
              : Icons.star_border),
          onPressed: () {
            Alert(
              context: context,
              type: AlertType.error,
              title: "Remove From Favorite List",
              desc:
                  "To remove This cuntry You must Remove it From the Home Page",
              buttons: [
                DialogButton(
                  child: Text(
                    "Ok",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () => Navigator.pop(context),
                  width: 120,
                )
              ],
            ).show();
          },
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: HexColor("#6dfae5"),
        body: Center(
          child: Text(
            "No Favorite city Selected",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }
  }
}
