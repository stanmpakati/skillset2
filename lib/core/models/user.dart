import 'package:skillset/core/models/education.dart';
import 'package:skillset/core/models/job.dart';
import 'package:skillset/core/models/portifolio.dart';
import 'package:skillset/core/models/pricing.dart';
import 'package:skillset/core/models/proposal.dart';
import 'package:skillset/core/models/review.dart';
import 'package:skillset/core/models/work_history.dart';

class User {
  final String userId;
  // final String atsign;
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
    this.userId,
    this.profilePicture,
    this.firstName,
    this.lastName,
    this.city,
    this.country,
    this.bio,
    this.jobsCompleted,
    this.reviews,
    this.stars,
    this.jobsProduced,
    this.proposalsRecieved,
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
  final List<Job> jobsTaken;
  final List<JobProposal> proposalsSent;

  Freelancer({
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
