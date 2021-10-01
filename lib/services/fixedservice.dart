import 'package:tourism/data/app_data.dart';

import '../models/trip.dart';

const String CategoryTripPage = '/category-trips';
const String TripDeails = '/trip-details';
const String FilterPage = '/filter-data';

bool isSummer = false;
bool isWinter = false;
bool isFamily = false;
List<Trip> trips = Trips_data;
List<Trip> Favtrips = [];

void filtertrip() {
  trips = Trips_data.where((trip) {
    // trip.categories.contains(categoryId)
    if (isSummer == true && trip.isInSummer != true) {
      return false;
    }
    if (isWinter == true && trip.isInWinter != true) {
      return false;
    }
    if (isFamily == true && trip.isForFamilies != true) {
      return false;
    }
    return true;
    // &&
    // trip.isInSummer == isSummer &&
    // trip.isInWinter == isWinter &&
    // trip.isForFamilies == isFamily
  }).toList();
}
