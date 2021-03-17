import 'package:flutter/material.dart';
import 'package:skillset/ui/screens/freelancer/home/freelancer_home.dart';
import 'package:skillset/ui/shared/utils/theme.dart';
import 'ui/screens/login/login.dart';
import 'ui/screens/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      initialRoute: LoginAtSign.id,
      routes: {
      LoginAtSign.id: (context) => LoginAtSign(),
      WelcomeScreen.id: (context) => WelcomeScreen(),
      FreelancerHome.id: (context) => FreelancerHome(),
    }
    );
  }
}
