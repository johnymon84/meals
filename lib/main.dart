import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screen/tabs_screen.dart';
import './screen/filters_screen.dart';
import './screen/categories_meal_screen.dart';
import './screen/meal_detail_screen.dart';
import './dummy_data.dart';
import './models/meals.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];

  void _toggleFavouriteList(String mealID) {
    final exist = _favouriteMeals.indexWhere((meal) => meal.id == mealID);
    if (exist >= 0) {
      setState(() {
        _favouriteMeals.removeAt(exist);
      });
    } else {
      setState(() {
        _favouriteMeals
            .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealID));
      });
    }
  }

  bool _isFavourite(String id) {
    return _favouriteMeals.any((meal) => meal.id == id);
  }

  void _applyFilter(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        //primaryColor: Colors.pinkAccent,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold)),
      ),
      //home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(_favouriteMeals),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) =>
            MealDetailScreen(_toggleFavouriteList, _isFavourite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _applyFilter),
      },
    );
  }
}
