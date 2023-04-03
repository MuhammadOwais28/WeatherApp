import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mosam/screens/homescreen.dart';
import 'package:mosam/screens/searchpage.dart';
import 'package:mosam/utils/routes.dart';
import 'package:mosam/view_model/search.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SeachProvider(),
      child: MaterialApp(
        title: 'MOSAM',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark),
        initialRoute: MyRoutes.homeRoute,
        routes: {
          MyRoutes.homeRoute: ((context) => const HomeScreen(
                city: 'karachi',
              )),
          MyRoutes.searchRoute: ((context) => const SearchBox()),
        },
      ),
    );
  }
}
