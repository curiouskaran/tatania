import 'package:flutter/material.dart';

import '../models/meal.dart';
import './categories_screen.dart';
import './favoritesScreen.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends StatelessWidget {
  static const routeName = '/';
  final List<Meal> favouriteMeals;

  TabsScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // By Default it is zero
      // initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Titania'),
          //For having Tabs in title bar
          // bottom: TabBar(
          //   tabs: <Widget>[
          //     Tab(
          //       icon: Icon(Icons.category),
          //       text: 'Categories',
          //     ),
          //     Tab(
          //       icon: Icon(Icons.favorite),
          //       text: 'Favorites',
          //     )
          //   ],
          // ),
        ),
        drawer: MainDrawer(),
        //For Having a bottom of scalfold tabs
        bottomNavigationBar: TabBar(
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.category),
              text: 'Categories',
            ),
            Tab(
              icon: Icon(Icons.favorite),
              text: 'Favorites',
            )
          ],
        ),
        body: TabBarView(children: <Widget>[
          CategoriesScreen(),
          FavoritesScreen(favouriteMeals)
        ]),
      ),
    );
  }
}
