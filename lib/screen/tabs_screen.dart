import 'package:flutter/material.dart';
import '../screen/categories_screen.dart';
import '../screen/favourites_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {
      'page': CategoriesScreen(),
      'title': 'Meal Categories',
    },
    {'page': FavouritesScreen(), 'title': 'Favourite'}
  ];
  int _currentPage = 0;
  void _selectePages(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_currentPage]['title']),
      ),
      body: _pages[_currentPage]['page'],
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
