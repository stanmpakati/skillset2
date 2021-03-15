import 'package:skillset/core/models/education.dart';
import 'package:skillset/core/models/portifolio.dart';
import 'package:skillset/core/models/pricing.dart';
import 'package:skillset/core/models/review.dart';
import 'package:skillset/core/models/work_history.dart';

class User {
  final String userId;
  final String firstName;
  final String lastName;
  final String city;
  final String country;
  final String bio;
  final int jobs;
  final List<Review> reviews;
  final double stars;

  User({
    this.userId,
    this.firstName,
    this.lastName,
    this.city,
    this.country,
    this.bio,
    this.jobs,
    this.reviews,
    this.stars,
  });
}

class Freelancer extends User {
  final String title;
  final List<String> skills;
  final List<Education> education;
  final List<WorkHistory> workHistory;
  final List<Review> reviews;
  final List<Price> priceList;
  final List<Portifolio> protifolioList;

  Freelancer({
    this.title,
    this.skills,
    this.education,
    this.workHistory,
    this.reviews,
    this.priceList,
    this.protifolioList,
  });
}
