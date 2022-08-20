///  display category in gridview
import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_items.dart';

class CategoriesScreen extends StatelessWidget {
  //const CategoriesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      /*get the list from dummy_categories and iterate using map and call the 
        categoryitem const which returns a widget which is used to display one container*/
      children: DUMMY_CATEGORIES
          .map((e) => CategoryItem(e.id, e.title, e.color))
          .toList(),
    );
  }
}
