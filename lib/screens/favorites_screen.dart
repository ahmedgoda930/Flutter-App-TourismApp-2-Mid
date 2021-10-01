import 'package:flutter/material.dart';
import 'package:tourism/services/fixedservice.dart';
import 'package:tourism/widgets/trip_item.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return TripItem(
          trip: Favtrips[index],
          removeitem: () {},
        );
      },
      itemCount: Favtrips.length,
    );
  }
}
