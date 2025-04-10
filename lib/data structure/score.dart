class WeeklyScore {
  final int week;
  final double score;

  WeeklyScore({required this.week, required this.score});
}

List<double> calculateImprovementsPercentage(List<WeeklyScore> scores) {
  List<double> improvements = [];
  for (int i = 1; i < scores.length; i++) {
    double improvement = ((scores[i].score - scores[i - 1].score) / scores[i - 1].score) * 100;
    improvements.add(improvement);
  }
  return improvements;
}

