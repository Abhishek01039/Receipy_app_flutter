import 'package:flutter/material.dart';
import 'package:receipy/models/meals.dart';

class FaveriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  FaveriteScreen(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (context, index) {
          return Card(
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
                          favoriteMeals[index].imageurl,
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
                              favoriteMeals[index].title,
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 26, color: Colors.white),
                            ),
                          ))
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
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
                            "${favoriteMeals[index].duration}",
                            style: TextStyle(fontSize: 25),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ));
        });
  }
}
