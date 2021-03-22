import 'package:flutter/material.dart';

Widget mainButton({String text, Function onPressed}) {
  return ElevatedButton(
    child: Text(
      text,
      style: TextStyle(fontWeight: FontWeight.w600),
    ),
    onPressed: onPressed,
  );
}
