import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {

  final Function path;
  final String text;
  final Color color;
  final double width;
  final double height;

  RoundedButton({@required this.color, @required this.path, @required this.text, @required this.width, @required this.height});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 60.0),
      child: Material(
        elevation: 5.0,
        color: this.color == null ? Colors.blue : this.color,
        borderRadius: BorderRadius.circular(20),
        child: MaterialButton(
          onPressed: this.path,
          minWidth: this.width == null ? 200 : this.width,
          height: 42,
          child: Text(
            this.text,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      )
    );
  }
}