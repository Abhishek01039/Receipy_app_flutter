import 'package:flutter/material.dart';

import 'models/meals.dart';
// import 'package:receipy/models/meals.dart';

class MealScreen extends StatefulWidget {
  final List<Meal> availableMeal;
  MealScreen(this.availableMeal);

  @override
  _MealScreenState createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final id = routeArg['id'];
    final title = routeArg['title'];
    final selectedcategory = widget.availableMeal.where((data) {
      return data.categories.contains(id);
    }).toList();
    // mealDetail(context) {
    //   Navigator.of(context).pushNamed('/meal-detail', arguments: id);
    // }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: selectedcategory.length,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () =>Navigator.of(context).pushNamed('/meal-detail', arguments: selectedcategory[index].id),
              child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
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
                              topRight: Radius.circular(15),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: Image.network(
                              selectedcategory[index].imageurl,
                              height: 250,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                              bottom: 20,
                              right: 10,
                              child: Container(
                                height: 60,
                                width: 300,
                                color: Colors.black54,
                                child: Text(
                                  selectedcategory[index].title,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 26, color: Colors.white),
                                ),
                              ))
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                        child: Container(
                          height: 30,
                          child: Row(
                            // crossAxisAlignment: CrossAxisAlignment.center
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Icon(
                                Icons.schedule,
                              ),
                              SizedBox(
                                width: 1,
                              ),
                              Text(
                                "${selectedcategory[index].duration}",
                                style: TextStyle(fontSize: 25),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )));
        },
      ),
    );
    // child: Text("WE RICH THAT!!!!!!!!!!!!!"),
  }
}
