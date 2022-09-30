// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, sort_child_properties_last, avoid_unnecessary_containers, unnecessary_string_interpolations, unnecessary_cast, unused_element, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:weather_app/model/favorite_city.dart';
import 'package:weather_app/model/weather_model_3h.dart';
import 'package:weather_app/screens/get_more_screen.dart';
import 'package:weather_app/widgets/future-container.dart';

import '../model/city.dart';
import '../model/cityData.dart';
import '../model/weather_model.dart';
import '../services/weather_api_c.dart';
import '../services/weather_api_client_3h.dart';
import 'addCity.dart';
import 'package:provider/provider.dart';

import 'favorites_city_screen.dart';

class HomeBody extends StatefulWidget {
  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  WeatherApiC client = WeatherApiC();

  Weather? data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("${Provider.of<CityData>(context, listen: false).favoriteWeather}");
    print("0: ${Provider.of<CityData>(context, listen: false).isExist}");
  }

  @override
  Widget build(BuildContext context) {
    Future<void> getData() async {
      data = await client
          .getCurrentWeather("${Provider.of<CityData>(context).cityName}");
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
        setState(() {
          Provider.of<CityData>(context, listen: false).addCityToFavortie(
              "${Provider.of<CityData>(context, listen: false).cityName}");
          Provider.of<CityData>(context, listen: false).isExist = true;
        });
      }

      print("${Provider.of<CityData>(context, listen: false).favoriteWeather}");
    }

    bool isHot(Weather aa) {
      if (aa.temp! > 30) {
        return true;
      } else {
        return false;
      }
    }

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
                            //"${data!.cityName}",
                            "${Provider.of<CityData>(context).cityName}",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 150,
                          ),
                          IconButton(
                            icon: Icon(Icons.add),
                            iconSize: 35,
                            onPressed: () {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (context) => SingleChildScrollView(
                                  child: Container(
                                      padding: EdgeInsets.only(
                                          bottom: MediaQuery.of(context)
                                              .viewInsets
                                              .bottom),
                                      child: AddCity()),
                                ),
                              );
                            },
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
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
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
                                      color: Color.fromARGB(198, 103, 102, 102),
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
                                  style: TextStyle(fontWeight: FontWeight.w500),
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
                                Text(
                                  "${data!.humidity}%",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
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
                            DaysContainer(
                              i: 0,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            DaysContainer(
                              i: 1,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            DaysContainer(
                              i: 2,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            DaysContainer(
                              i: 3,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            DaysContainer(
                              i: 4,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            DaysContainer(
                              i: 5,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            DaysContainer(
                              i: 6,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            DaysContainer(
                              i: 7,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            DaysContainer(
                              i: 8,
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
        onPressed: manageFavoriteList,
      ),
    );
  }
}
//Set(Provider.of<CityData>(context).cityName)