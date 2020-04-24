import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';
import '../screens/tabs_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildDrawerTile(
      IconData iconType, String tileName, Function tapHandler) {
    return ListTile(
      leading: Icon(
        iconType,
        size: 26,
      ),
      title: Text(
        tileName,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 120,
              padding: EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              color: Theme.of(context).accentColor,
              child: (Text(
                'Cooking up',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    color: Colors.white),
              )),
            ),
            SizedBox(
              height: 20,
            ),
            buildDrawerTile(Icons.restaurant, 'Meals', () {
              Navigator.of(context).pushReplacementNamed(TabsScreen.routeName);
            }),
            buildDrawerTile(Icons.settings, 'Filters', () {
              Navigator.of(context)
                  .pushReplacementNamed(FiltersScreen.routeName);
            }),
          ],
        ),
      ),
    );
  }
}
