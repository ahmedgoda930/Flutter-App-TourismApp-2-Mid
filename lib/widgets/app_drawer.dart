import 'package:flutter/material.dart';
import '../services/fixedservice.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            alignment: Alignment.center,
            color: Theme.of(context).accentColor,
            child: Text(
              'دليلك السياحى',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          SizedBox(height: 20),
          buildListTile('الرحلات', Icons.card_travel, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          SizedBox(height: 20),
          buildListTile('الفلترة', Icons.filter_list, () {
            Navigator.of(context).pushReplacementNamed(FilterPage);
          }),
        ],
      ),
    );
  }

  ListTile buildListTile(String txt, IconData ico, Function tapPress) {
    return ListTile(
        leading: Icon(
          ico,
          color: Colors.blue,
          size: 30,
        ),
        title: Text(
          txt,
          style: TextStyle(
            fontFamily: 'ElMessiri',
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () => tapPress());
  }
}
