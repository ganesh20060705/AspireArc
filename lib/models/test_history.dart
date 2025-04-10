import 'package:cloud_firestore/cloud_firestore.dart';

class TestHistory {
  final String testName;
  final double score;
  final DateTime completionTime;
  final double timeElapsed;

  TestHistory({
    required this.testName,
    required this.score,
    required this.completionTime,
    required this.timeElapsed,
  });

  factory TestHistory.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return TestHistory(
      testName: data['testName'],
      score: data['score'],
      completionTime: (data['completionTime'] as Timestamp).toDate(),
      timeElapsed: data['timeElapsed'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'testName': testName,
      'score': score,
      'completionTime': Timestamp.fromDate(completionTime),
      'timeElapsed': timeElapsed,
    };
  }
}
