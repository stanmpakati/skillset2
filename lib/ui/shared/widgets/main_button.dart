import 'package:flutter/material.dart';

Widget mainButton({String text, Function onPressed}) {
  return ElevatedButton(
    child: Text(text),
    onPressed: onPressed,
  );
}
