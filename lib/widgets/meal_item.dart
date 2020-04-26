import 'package:flutter/material.dart';

import '../screens/meal_detail_screen.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final int color;
  final String imageUrl;
  final int duration;
  final Affordability affordability;
  final Complexity complexity;

  MealItem({
    @required this.id,
    @required this.title,
    this.color = 4294951175,
    @required this.imageUrl,
    @required this.duration,
    @required this.affordability,
    @required this.complexity,
  });

  String get complexityLabel {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String get affordabilityLabel {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Pricey:
        return 'Pricey';
      case Affordability.Luxurious:
        return 'Luxurious';
      default:
        return 'Unknown';
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetailScreen.routeName,
        arguments: {'id': id, 'color': color}).then((result) {
      //if (result != null) deleteItem(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 350,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$duration mins')
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.landscape),
                      SizedBox(
                        width: 6,
                      ),
                      Text(complexityLabel)
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.atm),
                      SizedBox(
                        width: 6,
                      ),
                      Text(affordabilityLabel)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
