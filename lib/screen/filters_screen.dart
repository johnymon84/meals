import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function applyFilter;
  final Map<String, bool> selectedFilters;
  FiltersScreen(this.selectedFilters, this.applyFilter);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;
  bool _isLactoseFree = false;

  @override
  initState() {
    _isGlutenFree = widget.selectedFilters['gluten'];
    _isVegan = widget.selectedFilters['vegan'];
    _isVegetarian = widget.selectedFilters['vegetarian'];
    _isLactoseFree = widget.selectedFilters['lactose'];
    super.initState();
  }

  Widget _buildSwitchListTile(
      String title, String subtitle, bool state, Function tap) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        activeColor: Theme.of(context).primaryColor,
        inactiveThumbColor: Theme.of(context).accentColor,
        inactiveTrackColor: Theme.of(context).accentColor,
        value: state,
        onChanged: tap);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.save,
              color: Colors.white,
            ),
            onPressed: () {
              final selectedFilters = {
                'gluten': _isGlutenFree,
                'lactose': _isLactoseFree,
                'vegan': _isVegan,
                'vegetarian': _isVegetarian,
              };
              widget.applyFilter(selectedFilters);
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: Text('Adjust Meals Filters',
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
            ),
            _buildSwitchListTile(
                'Gluten Free', 'Exclude Gluten Free Meals', _isGlutenFree,
                (change) {
              setState(() {
                _isGlutenFree = change;
              });
            }),
            _buildSwitchListTile('Vegan ', 'Include Vegan Meals', _isVegan,
                (change) {
              setState(() {
                _isVegan = change;
              });
            }),
            _buildSwitchListTile(
                'Vegetarian', 'Include Vegetarian  Meals', _isVegetarian,
                (change) {
              setState(() {
                _isVegetarian = change;
              });
            }),
            _buildSwitchListTile(
                'Lactose Free', 'Exclude Lactose Free Meals', _isLactoseFree,
                (change) {
              setState(() {
                _isLactoseFree = change;
              });
            }),
          ],
        ),
      ),
    );
  }
}
