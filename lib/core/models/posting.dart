import 'package:flutter/foundation.dart';
import 'package:newserverdemo/core/models/enums/price_units.dart';
import 'package:newserverdemo/core/models/pricing.dart';

class Posting {
  final int postId;
  final String postedBy;
  final DateTime postedOn;
  final String title;
  final String description;
  final List<String> skills;
  final String location;
  final Price pay;

  Posting({
    this.postId,
    @required this.postedBy,
    @required this.postedOn,
    @required this.title,
    @required this.description,
    @required this.skills,
    @required this.location,
    @required this.pay,
  });

  Map<String, dynamic> toMap() {
    return {
      'postId': postId,
      'postedBy': postedBy,
      'postedOn': postedOn.toString(),
      'title': title,
      'description': description,
      'skills': skills,
      'location': location,
      'pay': pay.toMap(),
    };
  }

  factory Posting.fromJson(Map<String, dynamic> json) {
    return Posting(
      description: json['description'],
      location: json['location'],
      pay: json['pay'],
      postId: json['postId'],
      postedBy: json['postedBy'],
      postedOn: json['postedOn'],
      skills: json['skills'],
      title: json['title'],
    );
  }
}

Posting mockPosting = Posting(
  postId: 134,
  title: 'Help building wooden Chicken',
  description: '''I lost my beloved chicken, so to honour him I want a wooden 
  statue replica of him. I want a very experienced Carpenter to build it, He/she 
  must be able to catch the essence of my dead chicken. A Chicken lover will 
  have an added advantage (not lover in eating chicken duh) ''',
  skills: ['Carpentry', 'Art', 'Woodwork'],
  location: 'Muzarabani, Zimbabwe',
  pay: Price(amount: 3500, unit: 'Job'),
  postedBy: 'boris',
  postedOn: DateTime.now(),
);
