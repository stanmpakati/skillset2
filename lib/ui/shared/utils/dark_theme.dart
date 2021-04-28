import 'package:flutter/material.dart';

TextTheme darkTextTheme = TextTheme(
  headline1: TextStyle(
    fontFamily: 'BebasNeue',
    fontSize: 48.0,
    color: Colors.white,
  ),
  headline2: TextStyle(
    fontFamily: 'BebasNeue',
    fontSize: 32.0,
    color: Colors.white,
  ),
  headline3: TextStyle(
    fontFamily: 'BebasNeue',
    fontSize: 28.0,
    color: Colors.white,
  ),
  headline4: TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w900,
    color: Colors.white,
  ),
  headline5: TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w700,
    color: Colors.blue,
  ),
  headline6: TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  ),
  bodyText1: TextStyle(
    fontWeight: FontWeight.w700,
    color: Colors.white,
  ),
  bodyText2: TextStyle(color: Colors.white),
  caption: TextStyle(color: Colors.white54),
  subtitle1: TextStyle(
    fontFamily: 'BebasNeue',
    fontSize: 32.0,
    // color: Colors.black,
  ),
);

// Main theme for light mode
ThemeData darkTheme = ThemeData(
  // Colors
  brightness: Brightness.dark,
  primarySwatch: Colors.lightBlue,
  accentColor: Colors.orange,

  // main font
  fontFamily: 'Raleway',
  primaryTextTheme: darkTextTheme,

  // Styling the app bar
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
