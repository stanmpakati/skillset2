class Review {
  final String fromUser;
  final String toUser;
  final int stars;
  final String description;
  final int jobId;
  final DateTime dateReviewed;

  Review({
    this.fromUser,
    this.toUser,
    this.stars,
    this.description,
    this.jobId,
    this.dateReviewed,
  });
}
