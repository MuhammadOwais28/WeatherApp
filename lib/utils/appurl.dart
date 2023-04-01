class AppUrl {
  static late String _cityLocation;

  String get location => _cityLocation;
  set location(String loc) {
    _cityLocation = loc;
  }

  String getLoc(String city) =>
      "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=eb42031611601a1401c1e7423f7ce112&units=metric";
}
