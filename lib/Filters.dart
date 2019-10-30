import 'package:flutter/material.dart';
import 'Main_Drawer.dart';

class Filters extends StatefulWidget {
  static const routeName = '/filters';
  final Map<String, bool> _typeofmeal;
  final Function _setFilter;
  Filters(this._typeofmeal, this._setFilter);

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  bool _glutFree = false;
  bool _vegitarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;
  @override
  initState() {
    _glutFree = widget._typeofmeal['gluten-free'];
    _vegitarian = widget._typeofmeal['vegan'];
    _vegitarian = widget._typeofmeal['vagitarian'];
    _lactoseFree = widget._typeofmeal['lactoseFree'];
    super.initState();
  }

  Widget buildSwitchListTile(
      String title, String subtitle, bool currval, Function func) {
    return SwitchListTile(
      title: Text(title),
      value: currval,
      subtitle: Text(subtitle),
      onChanged: func,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final _typeofmeal = {
                  'gluten-free': _glutFree,
                  'vegan': _vegan,
                  'vagitarian': _vegitarian,
                  'lactoseFree': _lactoseFree,
                };
                widget._setFilter(_typeofmeal);
              })
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 100,
            child: Center(
                child: Text(
              "Adjust Your Meal selection.",
              style: TextStyle(fontSize: 26),
            )),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                buildSwitchListTile(
                    "Glutern-Free",
                    "This is provide detail about Gluten-Free Meals.",
                    _glutFree, (val) {
                  setState(() {
                    _glutFree = val;
                  });
                }),
                buildSwitchListTile(
                    "Lactor-Free",
                    "This is provide detail about Lactor-Free Meals.",
                    _lactoseFree, (val) {
                  setState(() {
                    _lactoseFree = val;
                  });
                }),
                buildSwitchListTile(
                    "Vagitarian",
                    "This is provide detail about Vagitarian Meals.",
                    _vegitarian, (val) {
                  setState(() {
                    _vegitarian = val;
                  });
                }),
                buildSwitchListTile("Vegan",
                    "This is provide detail about Vegan Meals.", _vegan, (val) {
                  setState(() {
                    _vegan = val;
                  });
                }),
              ],
            ),
          )
        ],
      ),
      drawer: DrawerData(),
    );
  }
}
