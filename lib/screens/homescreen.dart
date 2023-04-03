// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'package:mosam/services/weather_services.dart';
import 'package:mosam/utils/customfunctions.dart';

import 'package:mosam/utils/routes.dart';
import 'package:mosam/view_model/weatherconfig.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.city});
  final String city;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherServices weatherServices = WeatherServices();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          resizeToAvoidBottomInset: false,
          body: FutureBuilder(
              future: weatherServices.getCityData(widget.city),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: Loading());
                } else if (!snapshot.hasData) {
                  return Center(
                      child: Text(
                    'Data not found :"(',
                    style: Theme.of(context).textTheme.subtitle1,
                  ));
                } else {
                  return Stack(
                    children: [
                      Container(
                        height: height,
                        color: Colors.black,
                        child: Image.asset(
                          Time.getPic(snapshot.data!.timezone!),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${snapshot.data!.name!},${snapshot.data!.sys!.country!}",
                            textScaleFactor: 2,
                            style: const TextStyle(letterSpacing: 0.5),
                          ),
                          SizedBox(
                            height: height * .005,
                          ),
                          Center(
                            child: Text(
                              "${snapshot.data!.main!.temp!.toStringAsFixed(0)}°C",
                              // textScaleFactor: 3,
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          ),
                          SizedBox(
                            height: height * .005,
                          ),
                          Text(
                            "feels like ${snapshot.data!.main!.feelsLike!.toStringAsFixed(0)}°C",
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                          SizedBox(
                            height: height * .005,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                snapshot.data!.weather![0].main!,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              SizedBox(
                                width: width * .02,
                              ),
                              (WeatherConfig.geticon(snapshot
                                  .data!.weather![0].icon!
                                  .toLowerCase()))
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "H:${snapshot.data!.main!.tempMax!.toStringAsFixed(0)}",
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "L:${snapshot.data!.main!.tempMin!.toStringAsFixed(0)}",
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * .005,
                          ),
                          InfoRow(
                              title: "Pressure",
                              value: snapshot.data!.main!.pressure),
                          InfoRow(
                              title: "Humidity",
                              value: "${snapshot.data!.main!.humidity}%"),
                          InfoRow(
                              title: "Visibility",
                              value: "${snapshot.data!.visibility} meters"),
                          InfoRow(
                              title: "Wind Speed",
                              value: "${snapshot.data!.wind!.speed} m/s"),
                          InfoRow(
                              title: "Direction",
                              value:
                                  "${snapshot.data!.wind!.deg!.toStringAsFixed(0)}°"), //in sb ko agar grid view me krden to kesa?
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, MyRoutes.searchRoute);
                            },
                            child: Container(
                              height: height * .06,
                              width: width * .4,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.search),
                                  Text(
                                    "Search City",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  );
                }
              }))),
    );
  }
}

