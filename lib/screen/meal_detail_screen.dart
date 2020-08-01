import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  final Function _isFavourite;
  final Function _toggleFavouriteList;
  MealDetailScreen(this._toggleFavouriteList, this._isFavourite);
  Widget buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      height: 200,
      width: 300,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealID = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealID);
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text('${selectedMeal.title}'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildSectionTitle(context, 'Ingredients'),
              buildContainer(
                ListView.builder(
                    itemBuilder: (ctx, index) => Card(
                          color: Theme.of(context).accentColor,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Text(selectedMeal.ingredients[index]),
                          ),
                        ),
                    itemCount: selectedMeal.ingredients.length),
              ),
              buildSectionTitle(context, 'Steps'),
              buildContainer(
                ListView.builder(
                    itemBuilder: (ctx, index) => Column(
                          children: <Widget>[
                            ListTile(
                              leading: CircleAvatar(
                                child: Text('# ${(index + 1)}'),
                              ),
                              title: Text(selectedMeal.steps[index]),
                            ),
                            Divider(
                              color: Colors.grey,
                            ),
                          ],
                        ),
                    itemCount: selectedMeal.steps.length),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: _isFavourite(mealID)
                ? Icon(
                    Icons.star,
                    color: Theme.of(context).primaryColor,
                  )
                : Icon(Icons.star_border),
            onPressed: () {
              _toggleFavouriteList(mealID);
              // Navigator.of(context).pop(mealID);
            }),
      ),
    );
  }
}
