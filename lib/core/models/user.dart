import 'package:flutter/foundation.dart';
import 'package:newserverdemo/core/models/education.dart';
import 'package:newserverdemo/core/models/pricing.dart';
import 'package:newserverdemo/core/models/work_history.dart';

class Freelancer {
  final String userId;
  final String atSign;
  final String profilePicture;
  final String firstName;
  final String lastName;
  final String email;
  final String city;
  final String country;
  final String bio;
  final double stars;
  final String title;
  final List<String> skills;
  final List<Education> education;
  final List<WorkHistory> workHistory;
  final List<Price> priceList;

  Freelancer({
    @required this.userId,
    @required this.atSign,
    @required this.firstName,
    @required this.lastName,
    @required this.city,
    @required this.country,
    this.profilePicture,
    this.email,
    this.bio,
    this.stars = 0,
    this.priceList,
    this.title = 'Freelancer',
    this.skills,
    this.education,
    this.workHistory,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'atSign': atSign,
      'profilePicture': profilePicture,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'city': city,
      'country': country,
      'bio': bio,
      'stars': stars,
      'title': title,
      'skills': skills,
      'education': education.map((e) => e.toMap()).toList(),
      'workHistory': workHistory.map((w) => w.toMap()).toList(),
      'priceList': priceList.map((price) => price.toMap()).toList(),
    };
  }

  factory Freelancer.fromJson(Map<String, dynamic> json) {
    var _edu = json['education'] as List;
    List<Education> _eduList =
        _edu.map((edu) => Education.fromJson(edu)).toList();

    // work hisory
    var _wh = json['education'] as List;
    List<WorkHistory> _whList =
        _wh.map((wh) => WorkHistory.fromJson(wh)).toList();

    // price
    var _price = json['education'] as List;
    List<Price> _priceList =
        _price.map((price) => Price.fromJson(price)).toList();

    // skills
    List<String> _skills = [...json['skills']];

    return Freelancer(
      userId: json['userId'],
      atSign: json['atSign'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      city: json['city'],
      country: json['country'],
      profilePicture: json['profilePicture'],
      email: json['email'],
      bio: json['bio'],
      stars: json['stars'].toDouble(),
      title: json['title'],
      priceList: _priceList,
      education: _eduList,
      workHistory: _whList,
      skills: _skills,
    );
  }
}

Freelancer mockFreelancer = Freelancer(
  userId: '32',
  atSign: '@alice🛠',
  firstName: 'Alice',
  lastName: 'Wonder',
  city: 'Bulawayo',
  country: 'Zimbabwe',
  stars: 3.8,
  bio:
      "I am an experienced software engineer from Bulawayo, I was taught when I was still in primary by my Dad and now have been in the industry for over 15 years. I can recreate anythning you want me to make or come up with my own unique designs. The wait time largley depends on the project",
  title: 'App and Web Developer',
  education: [
    Education(
      certificate: "O'level",
      school: 'St Johns Emerald Hill High School',
      result: '16 As',
      yearGraduated: 1999,
    ),
    Education(
      certificate: "A'level",
      school: 'St Johns Emerald Hill High School',
      result: '2 points',
      yearGraduated: 2001,
    ),
  ],
  workHistory: [
    WorkHistory(
      companyName: 'Microsoft',
      finishingYear: 2009,
      startingYear: 2002,
      position: 'Senior Software Engineer',
    ),
  ],
  priceList: [
    Price(amount: 500, description: 'Small project', unit: 'project'),
    Price(amount: 900, description: 'Medium project', unit: 'project'),
  ],
  skills: ['flutter', 'angular', 'firebase', 'mysql', 'nodejs', 'django'],
);
