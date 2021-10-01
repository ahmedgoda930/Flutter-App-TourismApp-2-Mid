import 'package:flutter/material.dart';
import '../data/app_data.dart';
import '../services/fixedservice.dart';

class TripDetailsScreen extends StatefulWidget {
  @override
  _TripDetailsScreenState createState() => _TripDetailsScreenState();
}

class _TripDetailsScreenState extends State<TripDetailsScreen> {
  bool isFavorit(id) {
    return Favtrips.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    final tripid = ModalRoute.of(context)!.settings.arguments as String;
    final tripdet = Trips_data.firstWhere((t) => t.id == tripid);

    return Scaffold(
      appBar: AppBar(
        title: Text('${tripdet.title}'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                tripdet.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            headSectionTitle(context, 'الانشطة'),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: buildListViewContainer(
                ListView.builder(
                  itemCount: tripdet.activities.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 0.3,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Text(tripdet.activities[index]),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            headSectionTitle(context, 'البرنامج اليومي'),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: buildListViewContainer(
                ListView.builder(
                  itemCount: tripdet.program.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text(
                              'يوم ${index + 1}',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          title: Text(tripdet.program[index]),
                        ),
                        Divider(
                          thickness: 2,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Favtrips.add(
                Trips_data.firstWhere((element) => element.id == tripdet.id));
          });
          Navigator.of(context).pop(tripdet.id);
        },
        child: Icon(
          isFavorit(tripdet.id) ? Icons.star : Icons.star_border,
        ),
      ),
    );
  }

  Container headSectionTitle(BuildContext context, String txt) {
    return Container(
      alignment: Alignment.topRight,
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        txt,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }

  Widget buildListViewContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      height: 200,
      child: child,
    );
  }
}
