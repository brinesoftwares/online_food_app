import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:online_food_app/model/food_model.dart';
import 'package:online_food_app/pages/my_profile.dart';
import 'package:online_food_app/styles/grey_text_style.dart';
import 'package:online_food_app/widgets/food_rating.dart';

class FoodDetail extends StatefulWidget {
  final FoodModel foodData;
  FoodDetail({@required this.foodData});
  @override
  _FoodDetailState createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  var qty = 1;

  ContainerTransitionType _transitionType = ContainerTransitionType.fade;

  @override
  Widget build(BuildContext context) {
    const double _fabDimension = 56.0;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 18,
                    ),
                  ),
                  Icon(
                    Icons.favorite,
                    size: 20,
                    color: Colors.red,
                  ),
                ],
              ),
              Center(
                child: Container(
                  height: 220,
                  child: Image.asset(widget.foodData.image),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  width: 100.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(29.0),
                    color: Colors.amber[300],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.amber[300],
                        blurRadius: 5.0,
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          if (qty > 1) {
                            setState(() {
                              qty = qty - 1;
                            });
                          }
                        },
                        child: Text(
                          "-",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 25),
                        ),
                      ),
                      Text(
                        qty.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 25),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            qty = qty + 1;
                          });
                        },
                        child: Text(
                          "+",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 22),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    widget.foodData.name,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "₹",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.amber),
                      ),
                      Text(
                        widget.foodData.price,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  FoodInfo("assets/images/star.png", "4.6"),
                  FoodInfo("assets/images/cal.png",
                      widget.foodData.cal + " Calories"),
                  FoodInfo("assets/images/time.png", "20-30 Min"),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Text(
                "This is spicy south india food, prepared with dall, masala and another ingredients",
                style: GreyText,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Ingredients",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(">  Rice flour", style: GreyText),
                    Text(">  Urad dal", style: GreyText),
                    Text(">  Salt", style: GreyText),
                    Text(">  Methi", style: GreyText),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: OpenContainer(
        transitionType: _transitionType,
        transitionDuration: const Duration(milliseconds: 500),
        openBuilder: (BuildContext context, VoidCallback _) {
          return MyProfile();
        },
        closedElevation: 6.0,
        closedShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(_fabDimension / 2),
          ),
        ),
        closedColor: Colors.amber[300],
        openShape: const RoundedRectangleBorder(),
        closedBuilder: (BuildContext context, VoidCallback openContainer) {
          return SizedBox(
            height: _fabDimension,
            width: _fabDimension,
            child: Center(
              child: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
