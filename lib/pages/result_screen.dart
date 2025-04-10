import 'package:aspirearc/pages/home_page.dart';
import 'package:flutter/material.dart';


class ResultScreen extends StatelessWidget {
  final double score;
  final double timeElapsed; // Changed to double

  const ResultScreen({super.key, required this.score, required this.timeElapsed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Result'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Score: $score',
              style: const TextStyle(fontSize: 24.0),
            ),
            Text(
              'Time Elapsed: ${timeElapsed ~/ 60}:${(timeElapsed % 60).toString().padLeft(2, '0')}',
              style: const TextStyle(fontSize: 18.0),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator (context)  => const HomePage();
              },
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
