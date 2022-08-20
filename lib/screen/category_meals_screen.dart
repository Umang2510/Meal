/// This Widget shows the meals for chosen category

import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../Models/meals.dart';

class CategoryMealScreen extends StatefulWidget {
  //const CategoryMealScreen({Key key}) : super(key: key);
  static const routename = '/category-meals';
  final List<Meal> availableMeals;

  CategoryMealScreen(this.availableMeals);

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  // final String categoryID, categorytitle;
  String categoryTitle;
  List<Meal> displayedMeals;
  var _initDataLoad = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initDataLoad) {
      final routeArg =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArg['title'];
      final categoryID = routeArg['id'];
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryID);
      }).toList();
      _initDataLoad = true;
    }
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            complexity: displayedMeals[index].complexity,
            affordability: displayedMeals[index].affordability,

          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
