import 'package:flutter/material.dart';

Widget tag(BuildContext context, String text) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Theme.of(context).primaryColorLight,
    ),
    child: (Text(
      text,
      style: Theme.of(context).textTheme.caption,
    )),
  );
}
