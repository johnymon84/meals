import 'package:flutter/material.dart';
import '../screen/meal_detail_screen.dart';
import '../models/meals.dart';

class MealsItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  MealsItem(this.id, this.title, this.imageUrl, this.duration, this.complexity,
      this.affordability);
  String get complexityType {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'unknown';
        break;
    }
  }

  String get affordabilityType {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Expensive';
        break;
      default:
        return 'unknown';
        break;
    }
  }

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetailScreen.routeName, arguments: id);
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
                    child: Image.network(imageUrl,
                        height: 250, width: double.infinity, fit: BoxFit.cover),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Container(
                      width: 300,
                      color: Colors.black38,
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 25, color: Colors.white),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.schedule),
                        SizedBox(width: 6),
                        Text('$duration min')
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.work),
                        SizedBox(width: 6),
                        Text(complexityType)
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.attach_money),
                        SizedBox(width: 6),
                        Text(affordabilityType)
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
