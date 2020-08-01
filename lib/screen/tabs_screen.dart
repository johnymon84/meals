import 'package:flutter/material.dart';
import '../screen/categories_screen.dart';
import '../screen/favourites_screen.dart';
import '../widgets/main_drawer.dart';
import '../main.dart';
import '../models/meals.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMealList;
  TabsScreen(this.favouriteMealList);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _currentPage = 0;
  void _selectePages(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  List<Map<String, Object>> _pages = [];
  @override
  void initState() {
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Meal Categories',
      },
      {'page': FavouritesScreen(widget.favouriteMealList), 'title': 'Favourite'}
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_currentPage]['title']),
      ),
      body: _pages[_currentPage]['page'],
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectePages,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _currentPage,
          //type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text('Category'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text('Favourite'),
            ),
          ]),
    );
  }
}
