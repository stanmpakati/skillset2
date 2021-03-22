import 'package:flutter/foundation.dart';
import 'package:newserverdemo/core/models/enums/price_units.dart';
import 'package:newserverdemo/core/models/job.dart';
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
    @required this.postId,
    @required this.postedBy,
    @required this.postedOn,
    @required this.title,
    @required this.description,
    @required this.skills,
    @required this.location,
    @required this.pay,
  });
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
  pay: Price(amount: 3500, unit: PriceUnit.job),
  postedBy: 'boris',
  postedOn: DateTime.now(),
);
