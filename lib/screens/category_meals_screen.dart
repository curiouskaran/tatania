import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/categories-meals';
  //Required when getting data from constructor and not via route params
  // final String categoryId;
  // final String categoryTitle;
  // final int categoryColor;

  // CategoryMealsScreen(
  //     {@required this.categoryId,
  //     @required this.categoryTitle,
  //     @required this.categoryColor});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];
    final categoryColor = routeArgs['color'].value;
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        backgroundColor: Color(categoryColor),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              id: categoryMeals[index].id,
              color: categoryColor,
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              duration: categoryMeals[index].duration,
              affordability: categoryMeals[index].affordability,
              complexity: categoryMeals[index].complexity);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
