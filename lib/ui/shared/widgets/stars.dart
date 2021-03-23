import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Widget starsRating({@required double rating, bool bigSize = false}) {
  if (rating == null) {
    return SizedBox.shrink();
  }
  return RatingBarIndicator(
    rating: rating,
    itemBuilder: (context, index) => Icon(
      Icons.star,
      color: Colors.amberAccent,
    ),
    itemCount: 5,
    itemSize: bigSize ? 26.0 : 18.0,
  );
}
