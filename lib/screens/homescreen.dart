import 'package:flutter/material.dart';
import 'package:mosam/services/weather_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  WeatherServices weatherServices = WeatherServices();
  String city = "karachi";

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        // backgroundColor: Colors.blueGrey,

        body: Stack(
          // alignment: Alignment.center,
          children: [
            Container(
              height: height, //* .97,

              child: Image.asset(
                "assets/eximage4.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  TextFormField(
                    controller: searchController,
                    decoration: InputDecoration(
                        // hintStyle: TextStyle(color: Colors.black),
                        hintText: "Search any city",
                        contentPadding: const EdgeInsets.all(16),
                        prefixIcon: const Icon(Icons.search),
                        // color
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  SizedBox(
                    height: height * .1,
                  ),
                  FutureBuilder(
                      future: weatherServices.getCityData(city.toLowerCase()),
                      builder: ((context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else {
                          print(snapshot.data);
                          return Text(
                              snapshot.data!.main!.temp.toString()); //??
                          //Text("adsa");
                        }
                      }))
                  // Text(
                  //   "24C",
                  //   textScaleFactor: 3,
                  // ),
                  // Text(
                  //   "feels like 22C",
                  //   style: Theme.of(context).textTheme.subtitle2,
                  // ),
                  // SizedBox(
                  //   height: height * .005,
                  // ),
                  // Text(
                  //   "Karachi, Pak",
                  //   textScaleFactor: 2,
                  // ),
                  // SizedBox(
                  //   height: height * .1,
                  // ),
                  // Container(
                  //   height: height * .13,
                  //   child: ListView.builder(
                  //       physics: BouncingScrollPhysics(),
                  //       scrollDirection: Axis.horizontal,
                  //       itemCount: 5,
                  //       itemBuilder: ((context, index) {
                  //         return PredictionContainer(
                  //           height: height * .1,
                  //           width: width * .21,
                  //           day: "Mon",
                  //           temp: 17,
                  //           icon: CupertinoIcons.cloud_rain_fill,
                  //         );
                  //       })),
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PredictionContainer extends StatelessWidget {
  PredictionContainer(
      {super.key,
      required this.day,
      required this.temp,
      required this.icon,
      required this.width,
      required this.height});
  final String day;
  num temp;
  double height, width;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(day,
                textScaleFactor: 1.2, style: TextStyle(color: Colors.black)),
            SizedBox(
              height: 5,
            ),
            Icon(
              icon,
              color: Colors.grey[400],
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "${temp}C",
              textScaleFactor: 1.2,
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
