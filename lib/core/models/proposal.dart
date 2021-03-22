import 'package:newserverdemo/core/models/pricing.dart';

class JobProposal {
  final int proposalId;
  final String proposalBy;
  final int jobId;
  final String proposalStatement;
  final Price price;
  final String timeToFinish; // Change to DateTime
  final bool approved;
  final DateTime dateProposed;

  JobProposal({
    this.proposalId,
    this.proposalBy,
    this.jobId,
    this.proposalStatement,
    this.price,
    this.timeToFinish,
    this.approved,
    this.dateProposed,
  });
}
