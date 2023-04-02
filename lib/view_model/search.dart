import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mosam/screens/homescreen.dart';
import 'package:mosam/services/weather_services.dart';
import 'package:mosam/utils/routes.dart';

class SeachProvider extends ChangeNotifier {
  
  WeatherServices weatherServices = WeatherServices();
  TextEditingController searchController = TextEditingController();

  searchCity(BuildContext context) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => HomeScreen(city: searchController.text.toLowerCase()))));
  }

  
}
