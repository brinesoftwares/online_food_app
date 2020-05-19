
import 'package:flutter/material.dart';
import 'package:online_food_app/model/food_model.dart';

class FoodCard extends StatelessWidget {
    final FoodModel foodData;
  FoodCard({@required this.foodData});
  @override
  Widget build(BuildContext context) {
    return   Container(
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.all(Radius.circular(12)),
        color: Colors.grey[200],
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Container(
            height: 100,
            child: Image.asset(foodData.image),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            foodData.name,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
          Text(
            foodData.description,
            style: TextStyle(
                fontSize: 14, color: Colors.grey[600]),
          ),
          Row(
            crossAxisAlignment:
                CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/images/cal.png",
                height: 15,
              ),
              SizedBox(
                width: 2,
              ),
              Text(
                foodData.cal + " Calories",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 14,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "₹",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.amber),
              ),
              Text(
                foodData.price,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          )
        ],
      ),
    );
  }
}