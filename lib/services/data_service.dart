import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:aspirearc/models/test_history.dart';
import 'package:aspirearc/models/weekly_score.dart';


class DataService {
  final CollectionReference _testHistoryCollection =
      FirebaseFirestore.instance.collection('testHistory');
  final CollectionReference _weeklyScoresCollection =
      FirebaseFirestore.instance.collection('weeklyScores');

  // Fetch Weekly Scores (Simulated Data)
  Future<List<WeeklyScore>> fetchWeeklyScores() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
    // Return simulated weekly scores
    return [
      WeeklyScore(week: 1, score: 75),
      WeeklyScore(week: 2, score: 80),
      WeeklyScore(week: 3, score: 60),
      WeeklyScore(week: 4, score: 70),
    ];
  }

  // Fetch Test History from Firestore
  Future<List<TestHistory>> fetchTestHistory() async {
    try {
      final querySnapshot = await _testHistoryCollection.get();
      return querySnapshot.docs.map((doc) => TestHistory.fromFirestore(doc)).toList();
    } catch (e) {
      print('Error fetching test history: $e');
      throw Exception('Failed to fetch test history');
    }
  }

  // Fetch Test History as Stream
  Stream<List<TestHistory>> testHistoryStream() {
    return _testHistoryCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return TestHistory.fromFirestore(doc);
      }).toList();
    });
  }

  // Add Test History to Firestore
  Future<void> addTestHistory(TestHistory history) async {
    try {
      await _testHistoryCollection.add(history.toFirestore());
    } catch (e) {
      print('Error adding test history: $e');
      throw Exception('Failed to add test history');
    }
  }
}
