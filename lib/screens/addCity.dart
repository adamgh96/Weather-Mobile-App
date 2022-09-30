// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/model/cityData.dart';

class AddCity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String? newCity;
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: Text(
                'New City',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal[800],
                ),
              ),
            ),
          ),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: "Enter The Name of city",
            ),
            onChanged: (newText) {
              newCity = newText;
            },
          ),
          SizedBox(
            height: 30,
          ),
          TextButton(
            onPressed: () {
              Provider.of<CityData>(context, listen: false).addCity(newCity!);
              Provider.of<CityData>(context, listen: false).isExist = false;
              Navigator.pop(context);
              //print(newTask);
            },
            child: Text(
              'Get Weather',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            style: TextButton.styleFrom(
              backgroundColor: Colors.teal[400],
            ),
          )
        ],
      ),
    );
  }
}
