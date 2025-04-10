import 'package:flutter/material.dart';
import 'package:aspirearc/models/test_history.dart';
import 'package:aspirearc/services/data_service.dart';


class TestHistoryPage extends StatelessWidget {
  final DataService _dataService = DataService();

  TestHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test History'),
      ),
      body: StreamBuilder<List<TestHistory>>(
        stream: _dataService.testHistoryStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No test history found.'));
          }

          List<TestHistory> testHistory = snapshot.data!;

          return ListView.builder(
            itemCount: testHistory.length,
            itemBuilder: (context, index) {
              final history = testHistory[index];

              // Format completion time
              String formattedTime = '${history.completionTime.hour}:${history.completionTime.minute.toString().padLeft(2, '0')}';

              return ListTile(
                title: Text(history.testName),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Score: ${history.score.toStringAsFixed(2)}'),
                    Text('Completed: $formattedTime'), // Display formatted completion time
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
