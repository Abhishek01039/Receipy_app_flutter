import 'package:flutter/material.dart';
import 'dummy_data.dart';


class HomeScreen extends StatefulWidget {
  static const routeName='/';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(25),
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 4.0,
          children: DUMMY_CATEGORIES
              .map(
                (data) => InkWell(
                  borderRadius: BorderRadius.circular(20),
                  splashColor: Colors.amber,
                  onTap: () {
                    Navigator.pushNamed(context, '/category-meal',
                        arguments: {'id': data.id, 'title': data.title});
                  },
                  child: Container(
                    foregroundDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    // width: 300,
                    margin: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      colors: [data.color.withOpacity(0.7), data.color],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )),
                    child: Card(
                      child: Text(
                        data.title,
                        style: TextStyle(fontSize: 30),
                      ),
                      color: data.color,
                    ),
                  ),
                ),
              )
              .toList(),
        );
  }
}
