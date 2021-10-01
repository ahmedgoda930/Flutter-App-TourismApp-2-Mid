import 'package:flutter/material.dart';
import 'package:tourism/models/trip.dart';
import 'package:tourism/services/fixedservice.dart';
import 'package:tourism/widgets/trip_item.dart';

class CategoryTripsScreen extends StatefulWidget {
  // final String? categoryId, categoryTitle;

  // const CategoryTripsScreen({this.categoryId, this.categoryTitle});

  @override
  _CategoryTripsScreenState createState() => _CategoryTripsScreenState();
}

class _CategoryTripsScreenState extends State<CategoryTripsScreen> {
  String categoryId = '';
  String categoryTitle = '';
  List<Trip> filteredTrips = [];
  //مش هقدر استخدمها لانه مش هيعرف يشتغل على context param  لانها بتم قبل الشاشة ماتبدأ
  // فالبتالى هعوضها بالـ didchangedependancies
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final routArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    categoryId = routArgs['id'] as String;
    categoryTitle = routArgs['title'] as String;
    filteredTrips =
        trips.where((trip) => trip.categories.contains(categoryId)).toList();
  }

  void _removeTrip(String tripID) {
    setState(() {
      filteredTrips.removeWhere((element) => element.id == tripID);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle,
        ),
        elevation: 0,
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return TripItem(
            trip: filteredTrips[index],
            removeitem: _removeTrip,
          );
        },
        itemCount: filteredTrips.length,
      ),
    );
  }
}
