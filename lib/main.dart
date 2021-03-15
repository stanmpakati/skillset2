import 'package:flutter/material.dart';
import 'package:skillset/ui/screens/freelancer/freelancer_view.dart';
import 'package:skillset/ui/shared/utils/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      home: FreelancerView(),
    );
  }
}
