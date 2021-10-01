import 'package:flutter/material.dart';
import 'package:tourism/models/trip.dart';
import 'package:tourism/services/fixedservice.dart';

class TripItem extends StatelessWidget {
  final Trip trip;
  final Function removeitem;
  const TripItem({required this.trip, required this.removeitem});

  String get seasonText {
    switch (trip.season) {
      case Season.Winter:
        return 'شتاء';
      case Season.Spring:
        return 'ربيع';
      case Season.Summer:
        return 'صيف';
      case Season.Autumn:
        return 'خريف';
      default:
        return 'غير معروف';
    }
  }

  String get tripType {
    switch (trip.tripType) {
      case TripType.Exploration:
        return 'استكشاف';
      case TripType.Recovery:
        return 'نقاهة';
      case TripType.Activities:
        return 'انشطة';
      case TripType.Therapy:
        return 'معالجة';
      default:
        return 'غير معروف';
    }
  }

  void selectTrip(BuildContext context) {
    Navigator.of(context)
        .pushNamed(TripDeails, arguments: trip.id)
        .then((value) {
      if (value != null) removeitem(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectTrip(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 7,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    trip.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 250,
                  alignment: Alignment.bottomRight,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0),
                      Colors.black.withOpacity(0.3),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.topCenter,
                    stops: [
                      1,
                      .6
                    ], //بحدد من خخلالها من فين هيبدأ اللون بالظبط انا هخليه من المنتصف
                  )),
                  child: Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: Text(
                      trip.title,
                      style: Theme.of(context).textTheme.headline6,
                      overflow: TextOverflow.fade, // لو العنوان طوويل هيختفى
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.today,
                        color: Theme.of(context).accentColor,
                      ),
                      SizedBox(width: 6),
                      Text('${trip.duration} ايام'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.wb_sunny,
                        color: Theme.of(context).accentColor,
                      ),
                      SizedBox(width: 6),
                      Text(seasonText),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.family_restroom,
                        color: Theme.of(context).accentColor,
                      ),
                      SizedBox(width: 6),
                      Text(tripType),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
