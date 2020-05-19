import 'package:flutter/material.dart';

Widget FoodInfo(img, detail) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Image.asset(
        img,
        height: 15,
      ),
      SizedBox(
        width: 5,
      ),
      Text(
        detail,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
      )
    ],
  );
}
