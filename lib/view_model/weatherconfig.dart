import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherConfig {
  static Map<String, Icon> iconPack = {
    "01n": const Icon(
      CupertinoIcons.moon_fill,
      size: 35,
    ),
    "01d": const Icon(
      Icons.sunny,
      size: 35,
      color: Colors.yellow,
    ),
    "02n": const Icon(Icons.cloud_sharp, size: 35),
    "02d": const Icon(Icons.cloud_sharp, size: 35),
    "03n": const Icon(Icons.cloud_sharp, size: 35),
    "03d": const Icon(Icons.cloud_sharp, size: 35),
    "50n": const Icon(CupertinoIcons.smoke_fill, size: 35),
    "50d": const Icon(CupertinoIcons.smoke_fill, size: 35),
    "13d": const Icon(CupertinoIcons.cloud_snow_fill, size: 35),
    "13n": const Icon(CupertinoIcons.cloud_snow_fill, size: 35),
    "11d": const Icon(CupertinoIcons.cloud_bolt_rain_fill, size: 35),
    "11n": const Icon(CupertinoIcons.cloud_bolt_rain_fill, size: 35),
    "10n": const Icon(CupertinoIcons.cloud_rain_fill, size: 35),
    "10d": const Icon(CupertinoIcons.cloud_rain_fill, size: 35),
    "09n": const Icon(CupertinoIcons.cloud_rain_fill, size: 35),
    "09d": const Icon(CupertinoIcons.cloud_rain_fill, size: 35),
    "04n": const Icon(CupertinoIcons.smoke_fill, size: 35),
    "04d": const Icon(CupertinoIcons.smoke_fill, size: 35),
  };

  static Icon geticon(String key) {
    return WeatherConfig.iconPack[key] ?? Icon(Icons.cloud);
  }
}
