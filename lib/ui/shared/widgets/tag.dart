import 'package:flutter/material.dart';

Widget tag(BuildContext context, String text) {
  // return Container(
  //   decoration: BoxDecoration(
  //     borderRadius: BorderRadius.circular(20),
  //     color: Theme.of(context).primaryColorLight,
  //   ),
  //   child: (Text(
  //     text,
  //     style: Theme.of(context).textTheme.caption,
  //   ),),
  // );
  return Padding(
    padding: EdgeInsets.only(right: 4),
    child: Chip(
      backgroundColor: Theme.of(context).primaryColorLight,
      label: Text(
        text,
        style: Theme.of(context).textTheme.caption,
      ),
    ),
  );
}
