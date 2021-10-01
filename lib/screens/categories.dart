import 'package:flutter/material.dart';
import 'package:tourism/data/app_data.dart';
import 'package:tourism/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(5),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200, // تحييد عدد الاعمدة حسب عرض الشاشة لو
          //كان 300 هيعرض عمود واحد و لو كان 500 هيعرض عمودين
          childAspectRatio: 7 / 8, //تحديد عرض و طول العنصر
          mainAxisSpacing: 10, //فراغات بشكل افقى
          crossAxisSpacing: 10 //فراعات بشكل عمودى
          ),
      children: categories_data.map((e) => CategoryItem(category: e)).toList(),
    );
  }
}
