import 'package:flutter/material.dart';
import 'dummy_data.dart';

class MealDetail extends StatelessWidget {
  final Function togglefavorite;
  final Function isFavorite;
  MealDetail(this.togglefavorite,this.isFavorite);
  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as String;
    final selected = DUMMY_MEALS.firstWhere((meal) {
      // print(meal.id);
      return meal.id == routeArgs;
    });
    // print(selected);
    // print(selected.imageurl);
    // print(routeArgs);
    return Scaffold(
      appBar: AppBar(
        title: Text("${selected.title}"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Card(
                elevation: 4,
                child: ClipRRect(
                  child: Image.network("${selected.imageurl}"),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
              ),
              Text(
                "Ingredient",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Container(
                height: 100,
                width: 200,
                child: ListView.builder(
                  itemCount: selected.ingredient.length,
                  itemBuilder: (context, index) {
                    return Text("${selected.ingredient[index]}");
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
              ),
              Text("Steps",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Padding(
                padding: EdgeInsets.only(top: 15),
              ),
              Container(
                height: 250,
                width: 400,
                
                  child: ListView.builder(
                    itemCount: selected.step.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: <Widget>[
                          ListTile(
                            leading: CircleAvatar(
                              child: Text("${index.toString()}"),
                            ),
                            title: Text(selected.step[index].toString()),
                          ),
                          Divider(),
                        ],
                      );
                    },
                  ),
                ),
              
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(routeArgs) ? Icons.star: Icons.star_border,
        ),
        

        onPressed:() => togglefavorite(routeArgs),
      ),
    );
  }
}
