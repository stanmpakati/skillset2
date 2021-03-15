class Job {
  final int jobId;
  final String jobFrom;
  final String jobTo;
  final bool isCompleted;
  final int employerReview;
  final int freelancerReview;
  final DateTime dateStarted;
  final DateTime dateCompleted;

  Job({
    this.jobId,
    this.jobFrom,
    this.jobTo,
    this.isCompleted,
    this.employerReview,
    this.freelancerReview,
    this.dateStarted,
    this.dateCompleted,
  });
}
