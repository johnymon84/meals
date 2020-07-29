import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  //final String categoryTitle;
  //final String categoryId;
  //CategoryMealsScreen(this.categoryId, this.categoryTitle);
  static const routeName = '/category-meal';
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text('$categoryTitle'),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealsItem(
                categoryMeals[index].id,
                categoryMeals[index].title,
                categoryMeals[index].imageUrl,
                categoryMeals[index].duration,
                categoryMeals[index].complexity,
                categoryMeals[index].affordability);
          },
          itemCount: categoryMeals.length,
        ));
  }
}
