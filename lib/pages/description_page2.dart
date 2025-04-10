import 'package:flutter/material.dart';
import 'package:aspirearc/pages/verbal reasoning.dart';

class DescriptionPage extends StatelessWidget {
  final String testName;

  const DescriptionPage({super.key, required this.testName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$testName Test'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Welcome to the $testName Test!',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'Description: Verbal Reasoning assesses your ability to understand and reason using concepts framed in words. This section involves tasks such as reading comprehension, critical reasoning, and identifying relationships between words or phrases.',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VerbalReasoningPage(
                      onSubmit: (score, timeElapsed) {
                        // Handle the onSubmit callback if needed
                      },
                    ),
                  ),
                );
              },
              child: const Text('Start Test'),
            ),
          ],
        ),
      ),
    );
  }
}
