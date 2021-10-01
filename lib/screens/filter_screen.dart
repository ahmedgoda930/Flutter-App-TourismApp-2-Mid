import 'package:flutter/material.dart';
import 'package:tourism/services/fixedservice.dart';
import '../widgets/app_drawer.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _isSummer = false;
  var _isWinter = false;
  var _isFamily = false;
  @override
  void initState() {
    _isSummer = isSummer;
    _isWinter = isWinter;
    _isFamily = isFamily;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'الفلترة',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          Expanded(
              child: ListView(
            children: [
              buildSwitchListTile(
                'الرحلات الصيفية',
                'اظهار الرحلات الصيفية فقط',
                _isSummer,
                (val) {
                  setState(() {
                    _isSummer = val;
                    isSummer = _isSummer;
                    filtertrip();
                  });
                },
              ),
              buildSwitchListTile(
                'الرحلات الشتوية',
                'اظهار الرحلات الشتوية فقط',
                _isWinter,
                (val) {
                  setState(() {
                    _isWinter = val;
                    isWinter = _isWinter;
                    filtertrip();
                  });
                },
              ),
              buildSwitchListTile(
                'الرحلات العائلية',
                'اظهار الرحلات العائلية فقط',
                _isFamily,
                (val) {
                  setState(() {
                    _isFamily = val;
                    isFamily = _isFamily;
                    filtertrip();
                  });
                },
              ),
            ],
          ))
        ],
      ),
    );
  }

  SwitchListTile buildSwitchListTile(
      String title, String subtitle, var currentval, Function change) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentval,
      onChanged: (onChanged) => change(onChanged),
    );
  }
}
