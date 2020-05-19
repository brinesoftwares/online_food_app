import 'package:flutter/material.dart';

Widget listTile(img, type, icon, fontweight) {
  return ListTile(
    leading: Image.asset(
      img,
      height: 25,
    ),
    title: Text(
      type,
      style: TextStyle(fontWeight: fontweight, fontSize: 16),
    ),
    trailing: icon,
    onTap: () {},
  );
}
