import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:aspirearc/models/test_history.dart';
import 'package:aspirearc/models/weekly_score.dart';


class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Add Test History to Firestore
  Future<void> addTestHistory(TestHistory testHistory) async {
    try {
      await _db.collection('testHistory').add(testHistory.toFirestore());
    } catch (e) {
      print('Error adding test history: $e');
      throw Exception('Failed to add test history');
    }
  }

  // Stream of Test History from Firestore
  Stream<List<TestHistory>> getTestHistory() {
    return _db.collection('testHistory').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return TestHistory.fromFirestore(doc);
      }).toList();
    });
  }

  // Add Weekly Score to Firestore
  Future<void> addWeeklyScore(WeeklyScore weeklyScore) async {
    try {
      await _db.collection('weeklyScores').add(weeklyScore.toFirestore());
    } catch (e) {
      print('Error adding weekly score: $e');
      throw Exception('Failed to add weekly score');
    }
  }

  // Stream of Weekly Scores from Firestore
  Stream<List<WeeklyScore>> getWeeklyScores() {
    return _db.collection('weeklyScores').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return WeeklyScore.fromFirestore(doc);
      }).toList();
    });
  }

  // Add Test Score to Firestore
  Future<void> addTestScore(String userId, int score, int timeElapsed) async {
    try {
      await _db.collection('test_scores').add({
        'userId': userId,
        'score': score,
        'timeElapsed': timeElapsed,
        'timestamp': DateTime.now(),
      });
    } catch (e) {
      print('Error adding test score: $e');
      throw Exception('Failed to add test score');
    }
  }
}
