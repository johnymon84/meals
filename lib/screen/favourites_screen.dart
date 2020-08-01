import 'package:flutter/material.dart';
import '../models/meals.dart';
import '../widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> _favouriteMealList;
  FavouritesScreen(this._favouriteMealList);
  @override
  Widget build(BuildContext context) {
    if (_favouriteMealList.isEmpty) {
      return Center(
        child: Text('Add some favourites, the list is empty at this moment'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealsItem(
              _favouriteMealList[index].id,
              _favouriteMealList[index].title,
              _favouriteMealList[index].imageUrl,
              _favouriteMealList[index].duration,
              _favouriteMealList[index].complexity,
              _favouriteMealList[index].affordability);
        },
        itemCount: _favouriteMealList.length,
      );
    }
  }
}
