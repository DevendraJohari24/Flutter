import 'package:animation_app/model/DrinksListModel.dart';
import 'package:animation_app/widget/DrinksCard.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class DrinksList extends StatelessWidget {
  @override
  Widget build(BuildContext scaffoldContext) {
    return ScopedModelDescendant<DrinksListModel>(
      builder: (context, _, model) {
        return Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.all(6.0),
            children: model.drinkType.map((drinkType){
              return GestureDetector(
                onTap: (){
                  showDialog(context: scaffoldContext, builder: (BuildContext dialogContext){
                      return AlertDialog(
                        title: Text(
                          'Order',
                        ),
                        content: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.lime
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Image.asset(drinkType.image,
                              height: 100.0,
                              width: 100.0,
                                fit: BoxFit.cover,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      drinkType.title,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Text('Price: \$${drinkType.price}',
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        actions: [
                          FlatButton(onPressed: (){
                            Navigator.pop(dialogContext);
                          }, child: Text(
                            'Cancel',
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                          ),
                          FlatButton(onPressed: (){
                            Navigator.pop(dialogContext);
                            final snackbar = SnackBar(content: Text(
                              '${drinkType.title} order confirmed!!',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                              ),
                            ),
                            backgroundColor: Colors.white,
                            duration: Duration(
                              seconds: 4,
                            ),
                            );
                            Scaffold.of(scaffoldContext).showSnackBar(snackbar);
                          }, child: Text(
                            'Send',
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                          ),
                        ],
                      );
                  });
                },
                child: DrinksCard(
                  drinkType: drinkType,
                ),
              );
            }).toList(),
          ),
        );
      },
    );

  }
}
