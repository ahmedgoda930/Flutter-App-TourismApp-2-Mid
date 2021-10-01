// import 'package:flutter/material.dart';

// import 'categories.dart';
// import 'favorites_screen.dart';

// class TabsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('دليل ياحى'),
//           bottom: TabBar(
//             tabs: [
//               Tab(
//                 icon: Icon(Icons.dashboard),
//                 text: 'التصنيفات',
//               ),
//               Tab(
//                 icon: Icon(Icons.star),
//                 text: 'المفضلة',
//               ),
//             ],
//           ),
//         ),
//         body: TabBarView(children: [
//           CategoriesScreen(),
//           FavoritesScreen()
//         ],),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../screens/categories.dart';
import '../screens/favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  void _selectScreen(int index) {
    setState(() {
      _slectedindex = index;
    });
  }

  int _slectedindex = 0;
  final List<Map<String, Object>> _screens = [
    {'Screen': CategoriesScreen(), 'Title': 'تصنيفات الرحلات'},
    {'Screen': FavoritesScreen(), 'Title': 'المفضلة'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_slectedindex]['Title'] as String),
      ),
      drawer: AppDrawer(),
      body: _screens[_slectedindex]['Screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _slectedindex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.dashboard,
            ),
            label: 'التصنيفات',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
            ),
            label: 'المفضلة',
          ),
        ],
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
