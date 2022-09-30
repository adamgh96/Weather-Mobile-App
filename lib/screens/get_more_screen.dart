// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/services/weather_api_c.dart';

class GetMore extends StatelessWidget {
  Weather? data;
  WeatherApiC sun;
  GetMore({required this.data, required this.sun});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 216, 214, 214),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 15),
          child: Column(
            children: [
              //Sun Rise And Sun Set
              Container(
                width: 400,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 10, bottom: 10, right: 25),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 25,
                              ),
                              Image.asset(
                                "images/sunrise2-r.png",
                                height: 60,
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                "Sun Rise",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey),
                              )
                            ],
                          ),
                          Text(
                            "${sun.sunRise1.toString().substring(10, 16)}",
                            style: TextStyle(
                                fontSize: 27, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "images/sunset4-r.png",
                                height: 110,
                                width: 110,
                              ),
                              SizedBox(
                                width: 0,
                              ),
                              Text(
                                "Sun Set",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey),
                              )
                            ],
                          ),
                          Text(
                            "${sun.sunSet1.toString().substring(10, 16)}",
                            style: TextStyle(
                                fontSize: 27, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // Min Max Temp
              Container(
                width: 400,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 10, bottom: 10, right: 25),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 25,
                              ),
                              Image.asset(
                                "images/sun-r.png",
                                height: 60,
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                "Max Temp",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey),
                              )
                            ],
                          ),
                          Text(
                            "${data!.temp_max}°",
                            style: TextStyle(
                                fontSize: 27, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 25,
                              ),
                              Image.asset(
                                "images/sun-r.png",
                                height: 60,
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                "Min Temp",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey),
                              )
                            ],
                          ),
                          Text(
                            "${data!.temp_min}°",
                            style: TextStyle(
                                fontSize: 27, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //Humidity and wind
              Container(
                width: 400,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 15, bottom: 15, right: 25),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 25,
                              ),
                              Image.asset(
                                "images/humidity-r.png",
                                height: 40,
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                "Humidity",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey),
                              )
                            ],
                          ),
                          Text(
                            "${data!.humidity}%",
                            style: TextStyle(
                                fontSize: 27, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 33,
                              ),
                              Icon(
                                Icons.air,
                                size: 35,
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                "Wind ",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "${data!.wind}",
                                style: TextStyle(
                                    fontSize: 27, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Km/h",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
