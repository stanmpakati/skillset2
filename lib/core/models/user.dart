import 'package:flutter/foundation.dart';
import 'package:newserverdemo/core/models/education.dart';
import 'package:newserverdemo/core/models/enums/price_units.dart';
import 'package:newserverdemo/core/models/job.dart';
import 'package:newserverdemo/core/models/portifolio.dart';
import 'package:newserverdemo/core/models/pricing.dart';
import 'package:newserverdemo/core/models/proposal.dart';
import 'package:newserverdemo/core/models/review.dart';
import 'package:newserverdemo/core/models/work_history.dart';

class User {
  final String userId;
  final String atSign;
  final String profilePicture;
  final String firstName;
  final String lastName;
  final String city;
  final String country;
  final String bio;
  final int jobsCompleted;
  final List<Review> reviews;
  final double stars;
  final List<Job> jobsProduced;
  final List<JobProposal> proposalsRecieved;

  User({
    @required this.userId,
    @required this.atSign,
    this.profilePicture,
    @required this.firstName,
    @required this.lastName,
    this.city,
    this.country,
    this.bio,
    this.jobsCompleted,
    this.reviews,
    @required this.stars,
    this.jobsProduced,
    this.proposalsRecieved,
  });
}

class Freelancer extends User {
  final User user;
  final String title;
  final List<String> skills;
  final List<Education> education;
  final List<WorkHistory> workHistory;
  final List<Review> reviews;
  final List<Price> priceList;
  final List<Portifolio> protifolioList;
  final List<Job> jobsTaken;
  final List<JobProposal> proposalsSent;

  Freelancer({
    @required this.user,
    this.title,
    this.skills,
    this.education,
    this.workHistory,
    this.reviews,
    this.priceList,
    this.protifolioList,
    this.jobsTaken,
    this.proposalsSent,
  });
}

User mockUser = User(
    userId: '32',
    atSign: 'periwinkle',
    firstName: 'Boris',
    lastName: 'Zvangazvakanaka',
    city: 'Harare',
    country: 'Zimbabwe',
    stars: 3.8,
    bio: """Hey, I'm a very handsome youth from Zimbabwe, unlike that Munya or 
  Glen, I feel sorry for their ugliness and more so for me who has to look at 
  them, anyway As you can see I'm a very accomplished   software developer, I 
  should charge more but Stan(that handsome idiot) wouldn't allow me""");

Freelancer mockFreelancer = Freelancer(
  user: mockUser,
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
    Price(amount: 500, description: 'Small project', unit: PriceUnit.job),
    Price(amount: 900, description: 'Medium project', unit: PriceUnit.job),
  ],
  skills: ['flutter', 'angular', 'firebase', 'mysql', 'nodejs', 'django'],
);
