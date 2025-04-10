import 'package:flutter/material.dart';
import 'package:aspirearc/data structure/score.dart';

class ImprovementDetailsPage extends StatelessWidget {
  final List<WeeklyScore> scores;

  const ImprovementDetailsPage({super.key, required this.scores});

  @override
  Widget build(BuildContext context) {
    List<double> improvements = calculateImprovementsPercentage(scores);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Improvement Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            for (int i = 1; i < scores.length; i++)
              ListTile(
                title: Text('Week ${scores[i].week}'),
                subtitle: Text('Score: ${scores[i].score.toStringAsFixed(2)}'),
                trailing: Text('Improvement: ${improvements[i - 1].toStringAsFixed(2)}%'),
              ),
          ],
        ),
      ),
    );
  }
}
