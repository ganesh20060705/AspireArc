import 'package:flutter/material.dart';
import 'package:aspirearc/pages/description_page.dart';
import 'package:aspirearc/models/test_history.dart';
import 'package:aspirearc/services/firebase_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'weekly_analysis.dart';


class Prevhome extends StatefulWidget {
  const Prevhome({super.key});

  @override
  _PrevhomeState createState() => _PrevhomeState();
}

class _PrevhomeState extends State<Prevhome> {
  final FirestoreService _firestoreService = FirestoreService();
  late Stream<List<TestHistory>> _testHistoryStream;

  @override
  void initState() {
    super.initState();
    _testHistoryStream = _firestoreService.getTestHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF4ECF7),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'APTITUDE TEST',
          style: GoogleFonts.poppins(),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xffF8F9F9),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildTestButton(context, 'ARITHMETIC APTITUDE', () {
              _navigateToDescriptionPage('Arithmetic Aptitude');
            }),
            const SizedBox(height: 10),
            _buildTestButton(context, 'VERBAL REASONING', () {
              _navigateToDescriptionPage('Verbal Reasoning');
            }),
            const SizedBox(height: 70),
            _buildTestButton(context, 'LOGICAL REASONING', () {
              _navigateToDescriptionPage('Logical Reasoning');
            }),
            const SizedBox(height: 10),
            _buildTestButton(context, 'WEEKLY ANALYSIS', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WeeklyAnalysisPage()),
              );
            }),
            const SizedBox(height: 10),
            Expanded(
              child: StreamBuilder<List<TestHistory>>(
                stream: _testHistoryStream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return const Center(child: Text('Error loading test history'));
                  }
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No test history available'));
                  }
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final testHistory = snapshot.data![index];
                      return ListTile(
                        title: Text(testHistory.testName),
                        subtitle: Text(
                          'Score: ${testHistory.score}\n'
                          'Time Elapsed: ${testHistory.timeElapsed}s\n'
                          'Completed on: ${testHistory.completionTime}',
                        ),
                        isThreeLine: true,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToDescriptionPage(String testName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DescriptionPage(testName: testName),
      ),
    );
  }

  Widget _buildTestButton(BuildContext context, String label, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xffAD51D3),
        minimumSize: const Size(double.infinity, 100),
        elevation: 10,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Color(0xffF4ECF7),
          fontSize: 20,
        ),
      ),
    );
  }

  Future<void> _addTestHistory(String testName, double score, int timeElapsed) async {
    try {
      await _firestoreService.addTestHistory(TestHistory(
        testName: testName,
        score: score,
        completionTime: DateTime.now(),
        timeElapsed: timeElapsed.toDouble(),
      ));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Test score added successfully'),
        duration: Duration(seconds: 2),
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Failed to add test score'),
        duration: Duration(seconds: 2),
      ));
    }
  }
}
