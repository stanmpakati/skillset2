import 'package:flutter/material.dart';

Widget tabBar(BuildContext context) {
  // returns the Tab bar on the home screen
  return Container(
    height: 50,
    color: Theme.of(context).primaryColorLight,
    child: TabBar(
      labelStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
      unselectedLabelStyle: TextStyle(fontSize: 16.0),
      tabs: [
        Tab(text: 'Jobs for me'),
        Tab(text: 'Jobs on market'),
      ],
    ),
  );
}
