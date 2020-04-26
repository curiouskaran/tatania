import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/categories-meals';
  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  int categoryColor;
  List<Meal> displayedMeals;
  var loadInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!loadInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
      final categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title'];
      categoryColor = routeArgs['color'].value;
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      loadInitData = true;
    }

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    displayedMeals.removeWhere((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        backgroundColor: Color(categoryColor),
      ),
      body: displayedMeals.length > 0
          ? ListView.builder(
              itemBuilder: (ctx, index) {
                return MealItem(
                  id: displayedMeals[index].id,
                  color: categoryColor,
                  title: displayedMeals[index].title,
                  imageUrl: displayedMeals[index].imageUrl,
                  duration: displayedMeals[index].duration,
                  affordability: displayedMeals[index].affordability,
                  complexity: displayedMeals[index].complexity,
                  deleteItem: _removeMeal,
                );
              },
              itemCount: displayedMeals.length,
            )
          : Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                    'No dishes available in this prefrence for this category!!😞.Please try different category or try updating the filters.'),
              ),
            ),
    );
  }
}
