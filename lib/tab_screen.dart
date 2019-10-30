import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,child: TabBarView(children: <Widget>[
        Tab(icon: Icon(Icons.category),text:"Category",),
        Tab(icon: Icon(Icons.star),text:"dfsd",)
      ],),
      
    );
  }
}