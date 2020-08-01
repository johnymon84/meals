import 'package:flutter/material.dart';
import '../screen/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget menUItem(
      BuildContext ctx, String title, IconData icon, Function tapFun) {
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(ctx).primaryColor,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Theme.of(ctx).primaryColor),
      ),
      onTap: tapFun,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            padding: EdgeInsets.all(20),
            child: Text(
              'Cooking Menu',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Theme.of(context).primaryColor,
                fontSize: 30,
              ),
            ),
          ),
          menUItem(context, 'Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          menUItem(context, 'Filters', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          }),
        ],
      ),
    );
  }
}
