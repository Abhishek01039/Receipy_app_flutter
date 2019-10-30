import 'package:flutter/material.dart';

// import 'package:flutter/material.dart' as prefix0;

class DrawerData extends StatelessWidget {
  Widget buildListTile(String title,IconData icon,Function func){
    return ListTile(
      leading: Icon(icon),
      title: Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
      onTap:func,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: <Widget>[
        Container(
          height: 200,
          child: Center(
              child: Text(
            "Cooking Up!!!!",
            style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
          )),
          color: Colors.amber,
          ),
        
        buildListTile('Meals',Icons.restaurant,(){
          Navigator.pop(context);
          Navigator.of(context).pushReplacementNamed('/');
        }),
        buildListTile('Filters',Icons.settings,(){
          Navigator.pop(context);
          Navigator.of(context).pushReplacementNamed('/filters');
        }),
      ],
    ));
  }
}
