import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  //const FilterScreen({Key key}) : super(key: key);

  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilter;

  FilterScreen(this.currentFilter, this.saveFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false,
      _vegetarian = false,
      _vegan = false,
      _lactosFree = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _glutenFree = widget.currentFilter['gluten'];
    _lactosFree = widget.currentFilter['lactose'];
    _vegetarian = widget.currentFilter['vegetarian'];
    _vegan = widget.currentFilter['vegan'];
  }

  Widget _buildSwitchListTile(
      String title, String subTitle, bool currentValue, Function updateValue) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      subtitle: Text(
        subTitle,
        style: Theme.of(context).textTheme.bodySmall,
      ),
      title: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Filters'),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                final selectedFilter = {
                  'gluten': _glutenFree,
                  'lactose': _lactosFree,
                  'vegetarian': _vegetarian,
                  'vegan': _vegan,
                };
                widget.saveFilters(selectedFilter);
              },
              icon: const Icon(Icons.save),
            )
          ],
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection👌',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Expanded(
                child: ListView(
              children: <Widget>[
                //Gluten free
                _buildSwitchListTile(
                    'Gluten-free',
                    'Only includes Gluten-free meals. \nGluten in itself, especially gluten found in whole grains, is not bad for healthy people whose bodies can tolerate it.People with celiac disease have an immune reaction that is triggered by eating gluten.',
                    _glutenFree, (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                const SizedBox(
                  height: 30,
                ),

                //lactose free
                _buildSwitchListTile(
                    'Lactose-free',
                    'Only includes Lactose-free meals. \nLactose is a sugar that is naturally found in milk and milk products, like cheese or ice cream. In lactose intolerance, digestive symptoms are caused by lactose malabsorption. Lactose malabsorption is a condition in which your small intestine cannot digest, or break down, all the lactose you eat or drink.',
                    _lactosFree, (newValue) {
                  setState(() {
                    _lactosFree = newValue;
                  });
                }),
                const SizedBox(
                  height: 30,
                ),

                //vegetarian
                _buildSwitchListTile(
                    'Vegetarian',
                    'Only includes Vegetarian meals. \nVegetarianism is the practice of abstaining from the consumption of meat.',
                    _vegetarian, (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
                const SizedBox(
                  height: 30,
                ),

                //vegan
                _buildSwitchListTile(
                    'Vegan',
                    'Only includes Vegan meals. \nA strict vegetarian who consumes no food that comes from animals.',
                    _vegan, (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
              ],
            ))
          ],
        ));
  }
}
