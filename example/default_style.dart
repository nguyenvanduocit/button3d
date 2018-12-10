import 'package:button3d/button3d.dart';
import 'package:flutter/material.dart';

var button1 = Button3d(
  style: Button3dStyle(
    topColor: Colors.lightGreen,
    backColor: Colors.deepOrange,
    borderRadius: BorderRadius.zero
  ),
  onPressed: () {},
  child: Text("Add"),
);