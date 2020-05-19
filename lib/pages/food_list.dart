import 'package:animate_do/animate_do.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:online_food_app/model/food_model.dart';
import 'package:online_food_app/pages/food_details.dart';
import 'package:online_food_app/widgets/food_card.dart';

class FoodList extends StatefulWidget {
  @override
  _FoodListState createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  List<FoodModel> foods = [
    FoodModel("", "", "", "", ""),
    FoodModel(
        "Dosa", "With spicy Chutney", "65", "45.75", "assets/images/dosa.png"),
    FoodModel("Full Meals", "With five Side-Dish", "128", "110.00",
        "assets/images/meals.png"),
    FoodModel("Poori", "With Potato Chutney", "78", "50.00",
        "assets/images/poori.png"),
    FoodModel("Paniyaram", "With spicy Chutneyy", "43", "35.00",
        "assets/images/paniyaram.png"),
    FoodModel("Vada", "Set of Seven", "65", "50.00", "assets/images/vada.png"),
    FoodModel(
        "Roti", "With Veg Gravy", "93", "40.00", "assets/images/roti.png"),
  ];

  ContainerTransitionType _transitionType = ContainerTransitionType.fade;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Text(
              "South Indian Foods",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 250,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search Food",
                      hintStyle: TextStyle(fontSize: 16, color: Colors.black),
                      prefixIcon: Padding(
                        padding: const EdgeInsetsDirectional.only(start: 15.0),
                        child: Icon(
                          Icons.search,
                          size: 22,
                          color: Colors.black,
                        ),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                new Container(
                  width: 40.00,
                  height: 40.00,
                  decoration: new BoxDecoration(
                    color: Colors.amber[400],
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Icon(
                    Icons.filter_list,
                    size: 18,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverStaggeredGrid.countBuilder(
                      crossAxisCount: 2,
                      staggeredTileBuilder: (_) => StaggeredTile.fit(1),
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      itemCount: foods.length,
                      itemBuilder: (context, index) => index == 0
                          ? BounceInUp(
                              child: Container(
                                height: 30,
                                child: Center(
                                  child: Text(
                                    "Found 80 results",
                                    style: TextStyle(
                                        fontSize: 21,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            )
                          : index.isOdd
                              ? FadeInRight(
                                  delay: Duration(milliseconds: 100 * index),
                                  duration: Duration(milliseconds: 1000),
                                  child: animatedContainer(foods[index]))
                              : FadeInLeft(
                                  delay: Duration(milliseconds: 100 * index),
                                  duration: Duration(milliseconds: 1000),
                                  child: animatedContainer(foods[index]),
                                )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget animatedContainer(foods) {
    return OpenContainer(
      transitionType: _transitionType,
      transitionDuration: const Duration(milliseconds: 700),
      closedElevation: 0,
      openShape: const RoundedRectangleBorder(),
      openBuilder: (BuildContext context, VoidCallback _) {
        return FoodDetail(
          foodData: foods,
        );
      },
      tappable: false,
      closedBuilder: (BuildContext _, VoidCallback openContainer) {
        return SizedBox(
          child: InkWell(
            onTap: openContainer,
            child: FoodCard(foodData: foods),
          ),
        );
      },
    );
  }
}
