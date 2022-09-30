// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../model/cityData.dart';
import '../model/weather_model_3h.dart';
import '../services/weather_api_client_3h.dart';

class HoureFavoriteContainer extends StatelessWidget {
  final int i;

  Weather3h? dataFuture;
  WeatherApiClient3h cl = WeatherApiClient3h();

  HoureFavoriteContainer({required this.i});

  @override
  Widget build(BuildContext context) {
    Future<void> getFutureData() async {
      dataFuture = await cl.getFutureWeather(
          "${Provider.of<CityData>(context).favoriteWeather[0]}") as Weather3h?;
    }

    return FutureBuilder(
      future: getFutureData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Column(
            children: [
              Container(
                height: 200,
                width: 150,
                decoration: BoxDecoration(
                  color: HexColor("#95f6f5"),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,

                      blurRadius: 20,
                      offset: Offset(-5, 10), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 13.0),
                      child: Text(
                        "${dataFuture!.time[i]!.substring(11)} PM",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(198, 103, 102, 102)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        children: [
                          Image.asset(
                            "images/temp-r.png",
                            width: 30,
                            height: 30,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "${dataFuture!.temp[i]}°",
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: dataFuture!.temp[i]! > 30
                                    ? Colors.red[900]
                                    : Colors.blue[900]),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50.0),
                          child: Row(
                            children: [
                              Flexible(
                                child: Icon(
                                  Icons.egg_outlined,
                                  size: 15,
                                  color: Color.fromARGB(198, 103, 102, 102),
                                ),
                              ),
                              Text(
                                "${dataFuture!.humidity[i]}%",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(198, 103, 102, 102)),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Row(
                            children: [
                              //Icon(Icons.egg_outlined),
                              Flexible(
                                flex: 5,
                                child: Icon(Icons.air,
                                    size: 17,
                                    color: Color.fromARGB(198, 103, 102, 102)),
                              ),
                              Text(
                                "${dataFuture!.wind[i]}Km/h",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(198, 103, 102, 102)),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "${dataFuture!.temp_min[i]}°/${dataFuture!.temp_max[i]}°",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(198, 103, 102, 102)),
                        ),
                        SizedBox(
                          height: 6,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}
