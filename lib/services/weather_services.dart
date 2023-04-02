import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mosam/models/weathermodel.dart';
import 'package:mosam/utils/appurl.dart';

class WeatherServices {
  AppUrl appUrl = AppUrl();
  Future<WeatherModel> getCityData(String city) async {
    try {
      final response =
          await http.get(Uri.parse(appUrl.getLoc(city.toLowerCase())));

      if (response.statusCode == 200) {
        return WeatherModel.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 404) {
        throw Exception('Error 404 data not found');
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      throw Exception("Error 404 Server not found");
    }
  }
}
