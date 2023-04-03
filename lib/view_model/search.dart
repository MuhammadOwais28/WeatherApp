import 'package:flutter/material.dart';

import 'package:mosam/screens/homescreen.dart';
import 'package:mosam/services/weather_services.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';

class SeachProvider extends ChangeNotifier {
  WeatherServices weatherServices = WeatherServices();
  TextEditingController searchController = TextEditingController();

  searchCity(BuildContext context) {
    if (searchController.text.isEmpty) {
      Flushbar(
        flushbarPosition: FlushbarPosition.BOTTOM,
        backgroundColor: Colors.blue.shade900, //Color.fromARGB(255, 6, 8, 80),
        duration: const Duration(seconds: 2),
        icon: const Icon(Icons.error_outline_outlined),
        messageText: const Text(
          "Please Enter something :')",
          style: TextStyle(
              fontSize: 16.0,
              color: Colors.white,
              fontFamily: "ShadowsIntoLightTwo"),
        ),
      ).show(context);
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: ((context) =>
                  HomeScreen(city: searchController.text.toLowerCase()))));
    }
  }
}
