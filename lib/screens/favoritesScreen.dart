import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favouratedMeals;

  FavoritesScreen(this.favouratedMeals);
  @override
  Widget build(BuildContext context) {
    return favouratedMeals.isEmpty
        ? Center(
            child: Text('You have no favourites 😄 - Start adding some.'),
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return MealItem(
                id: favouratedMeals[index].id,
                title: favouratedMeals[index].title,
                imageUrl: favouratedMeals[index].imageUrl,
                duration: favouratedMeals[index].duration,
                affordability: favouratedMeals[index].affordability,
                complexity: favouratedMeals[index].complexity,
              );
            },
            itemCount: favouratedMeals.length,
          );
  }
}
