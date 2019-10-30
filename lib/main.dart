import 'package:flutter/material.dart';
import 'package:receipy/Categories_screen.dart';
import 'package:receipy/Filters.dart';
import 'package:receipy/dummy_data.dart';
// import 'Categories_screen.dart';
import 'Meal_second_page.dart';
import 'faveriteScreen.dart';
import 'meal-detail-screen.dart';
import 'Main_Drawer.dart';
// import 'dummy_data.dart';
import 'models/meals.dart';
// import 'Categories_screen.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _typeofmeal = {
    'gluten-free': false,
    'vegan': false,
    'vagitarian': false,
    'lactoseFree': false,
  };
  _setFilter(Map<String, bool> filterData) {
    setState(() {
      _typeofmeal = filterData;

      availableMeal = DUMMY_MEALS.where((meal) {
        if (_typeofmeal['gluten-free'] && !meal.isGlutenFree) {
          return false;
        }
        if (_typeofmeal['lactoseFree'] && !meal.isLactoseFree) {
          return false;
        }
        if (_typeofmeal['vagitarian'] && !meal.isVegitarian) {
          return false;
        }
        if (_typeofmeal['vegan'] && !meal.isVegan) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  List<Meal> availableMeal = DUMMY_MEALS;

  List<Meal> favoriteMeals = [];

  List<Map<String, Object>> pages;
  int _selectedPage = 0;
  selectedItem(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  bool isFavorite(String id) {
    return favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  void initState() {
    pages = [
      {'page': HomeScreen(), 'title': "Categories"},
      {'page': FaveriteScreen(favoriteMeals), 'title': "Your favorite"}
    ];
    super.initState();
  }

  togglefavorite(String mealId) {
    int existingInex = favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingInex >= 0) {
      setState(() {
        favoriteMeals.removeAt(existingInex);
      });
    } else {
      setState(() {
        favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Receipy",
      home: Scaffold(
        appBar: AppBar(
          title: Text(pages[_selectedPage]['title']),
        ),
        drawer: DrawerData(),
        body: pages[_selectedPage]['page'],
        bottomNavigationBar: BottomNavigationBar(
          onTap: selectedItem,
          currentIndex: _selectedPage,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), title: Text("Category")),
            BottomNavigationBarItem(
                icon: Icon(Icons.star), title: Text("Favorite"))
          ],
        ),
      ),

      // this is dictionary.
      routes: {
        // '/': (context) => HomeScreen(),
        '/category-meal': (context) => MealScreen(availableMeal),
        '/meal-detail': (context) => MealDetail(togglefavorite, isFavorite),
        '/filters': (context) => Filters(_typeofmeal, _setFilter)
      },
    );
  }
}
