import 'package:cloud_firestore/cloud_firestore.dart';

class WeeklyScore {
  final int week;
  final double score;

  WeeklyScore({required this.week, required this.score});

  // Convert to Firestore map
  Map<String, dynamic> toFirestore() {
    return {
      'week': week,
      'score': score,
    };
  }

  // Create from Firestore document
  factory WeeklyScore.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return WeeklyScore(
      week: data['week'],
      score: data['score'].toDouble(),
    );
  }
}
