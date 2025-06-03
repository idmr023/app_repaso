class StudyStats {
  int cardsReviewed;
  Duration totalStudyTime;
  int totalCorrect;
  int totalQuestions;

  StudyStats({
    this.cardsReviewed = 0,
    this.totalStudyTime = Duration.zero,
    this.totalCorrect = 0,
    this.totalQuestions = 0,
  });

  double get accuracy {
    if (totalQuestions == 0) return 0;
    return (totalCorrect / totalQuestions) * 100;
  }
}