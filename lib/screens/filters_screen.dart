import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  static const routeName = '/filters';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('apply filters'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('lol!!!'),
      ),
    );
  }
}
