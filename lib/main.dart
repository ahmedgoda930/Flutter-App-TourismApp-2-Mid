import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tourism/screens/category_trips.dart';
import '../screens/filter_screen.dart';
import 'package:tourism/screens/tabs_screen.dart';
import 'package:tourism/screens/trip_details_screen.dart';
import '../services/fixedservice.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.amber,
        fontFamily: 'ElMessiri',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline5: TextStyle(
                color: Colors.blue,
                fontFamily: 'ElMessiri',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              headline6: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontFamily: 'ElMessiri',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      title: "Tourisim App",
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar', 'AR'),
      ],
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(),
        CategoryTripPage: (ctx) => CategoryTripsScreen(),
        TripDeails: (ctx) => TripDetailsScreen(),
        FilterPage: (ctx) => FilterScreen(),
      },
    );
  }
}
