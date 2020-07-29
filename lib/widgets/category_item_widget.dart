import 'package:flutter/material.dart';
import '../screen/categories_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;
  CategoryItem(this.id, this.title, this.color);

  void selectCategory(BuildContext ctx, String title) {
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName, arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context, title),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(title,
            style: Theme.of(context).textTheme.headline6.copyWith(
              color: Colors.white,
              shadows: [
                Shadow(
                    color: Colors.black45, offset: Offset(1, 1), blurRadius: 1)
              ],
            )),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade50,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(1, 1), // changes position of shadow
            ),
          ],
          gradient: LinearGradient(
            colors: [
              color.withOpacity(.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
