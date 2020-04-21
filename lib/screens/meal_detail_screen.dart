import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  @override
  Widget build(BuildContext context) {
    final routeParams =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
          title: Text(routeParams['id']),
          backgroundColor: Color(routeParams['color'])),
      body: Center(
        child: Text('${routeParams['id']} - is meal id'),
      ),
    );
  }
}
