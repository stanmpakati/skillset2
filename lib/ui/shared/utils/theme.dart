import 'package:flutter/material.dart';

TextTheme textTheme = TextTheme(
  headline1: TextStyle(fontFamily: 'BebasNeue', fontSize: 48.0),
  headline2: TextStyle(fontFamily: 'BebasNeue', fontSize: 32.0),
  headline3: TextStyle(fontFamily: 'BebasNeue', fontSize: 24.0),
  headline4: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w900),
  headline5: TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.w700, color: Colors.blue),
  headline6: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
  bodyText1: TextStyle(fontWeight: FontWeight.w700),
  caption: TextStyle(color: Colors.black54),
  subtitle1: TextStyle(
    fontFamily: 'BebasNeue',
    fontSize: 32.0,
    color: Colors.white,
  ),
);

// Main theme for light mode
ThemeData lightTheme = ThemeData(
  // Colors
  brightness: Brightness.light,
  primaryColor: Colors.lightBlue,
  accentColor: Colors.orange,

  // main font
  fontFamily: 'Raleway',

  // primaryTextTheme: Typography.material2018().white,
  primaryTextTheme: textTheme,

  scaffoldBackgroundColor: Color(0xFFf2f2f2),

  // Stypling the app bar
  appBarTheme: AppBarTheme(
    textTheme: TextTheme(
      headline6: TextStyle(
        fontFamily: 'BebasNeue',
        fontSize: 32.0,
        color: Colors.white,
      ),
    ),
  ),
);
