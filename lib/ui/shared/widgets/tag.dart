import 'package:flutter/material.dart';

Widget tag(BuildContext context, String text) {
  return Padding(
    padding: EdgeInsets.only(right: 4),
    child: Chip(
      backgroundColor: Colors.blue[200],
      label: Text(
        text,
        style: TextStyle(fontSize: 12.0, color: Colors.black87),
      ),
    ),
  );
}
