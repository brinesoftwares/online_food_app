import 'package:flutter/material.dart';
import 'package:online_food_app/styles/grey_text_style.dart';
import 'package:online_food_app/widgets/list_tile.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 20, left: 20),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 18,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: <Widget>[
                      new Container(
                          width: 50.00,
                          height: 50.00,
                          decoration: new BoxDecoration(
                            color: Colors.amber[600],
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            image: new DecorationImage(
                              image: AssetImage('assets/images/user.png'),
                              fit: BoxFit.fitHeight,
                            ),
                          )),
                      SizedBox(
                        width: 25,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Dinesh Kumar",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "dineshkumar315007@gmail.com",
                            style: GreyText,
                          ),
                          Text(
                            "User ID: 156A860",
                            style: GreyText,
                          ),
                        ],
                      )
                    ],
                  ),
                  TabBar(
                    indicatorPadding: EdgeInsets.all(5),
                    indicatorColor: Colors.amber,
                    labelColor: Colors.black,
                    labelStyle: TextStyle(
                        fontFamily: "BalooTamma",
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                    tabs: [
                      Tab(text: "Account"),
                      Tab(text: "Payments"),
                      Tab(text: "History"),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Center(child: Text("Account details")),
                  Scaffold(
                    body: Container(
                      padding: EdgeInsets.all(18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "My Cards",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                height: 170.0,
                                width: 260.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/debit_card.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                  shape: BoxShape.rectangle,
                                ),
                              ),
                              Container(
                                width: 40,
                                height: 40,
                                child: Icon(
                                  Icons.add,
                                  size: 20,
                                ),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 2),
                                    shape: BoxShape.circle,
                                    color: Colors.amber,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.amber[300],
                                          blurRadius: 15.0,
                                          spreadRadius: 0.5)
                                    ]),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Add new Cards",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          listTile(
                              'assets/images/google.png',
                              'Google Pay',
                              Icon(Icons.radio_button_checked,
                                  color: Colors.amber[400]),
                              FontWeight.w600),
                          listTile(
                              'assets/images/mc.png',
                              'Credit Card',
                              Icon(Icons.radio_button_unchecked,
                                  color: Colors.grey),
                              FontWeight.w400),
                          listTile(
                              'assets/images/apple.png',
                              'Apple Pay',
                              Icon(Icons.radio_button_unchecked,
                                  color: Colors.grey),
                              FontWeight.w400),
                        ],
                      ),
                    ),
                    floatingActionButton: ButtonTheme(
                      minWidth: 300,
                      child: RaisedButton(
                        onPressed: () {},
                        child: Text(
                          "Buy Now",
                          style: TextStyle(color: Colors.black),
                        ),
                        color: Colors.amber,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    floatingActionButtonLocation:
                        FloatingActionButtonLocation.centerFloat,
                  ),
                  Center(child: Text("History details")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
