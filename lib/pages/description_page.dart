import 'package:flutter/material.dart';
import 'package:aspirearc/pages/arithmetic aptitude.dart';
import 'package:aspirearc/pages/logical reasoning.dart';
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
            Text(
              _getDescription(testName),
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                _navigateToTestPage(context, testName);
              },
              child: const Text('Start Test'),
            ),
          ],
        ),
      ),
    );
  }

  String _getDescription(String testName) {
    switch (testName) {
      case 'Verbal Reasoning':
        return 'Description: Verbal Reasoning assesses your ability to understand and reason using concepts framed in words. It involves reading comprehension, critical reasoning, and identifying relationships between words or phrases.';
      case 'Logical Reasoning':
        return 'Description: Logical Reasoning assesses your ability to think clearly and solve problems using structured thinking. It includes tasks like number series, pattern recognition, and logical puzzles.';
      case 'Arithmetic Aptitude':
        return 'Description: This section assesses your ability in solving arithmetic problems, understanding mathematical concepts, and applying them to various scenarios. You may encounter problems involving basic calculations, percentages, ratios, and more.';
      default:
        return 'No description available for this test.';
    }
  }

  void _navigateToTestPage(BuildContext context, String testName) {
    Widget testPage;

    switch (testName) {
      case 'Verbal Reasoning':
        testPage = VerbalReasoningPage(
          onSubmit: (score, timeElapsed) {
            // Handle the onSubmit callback if needed
          },
        );
        break;
      case 'Logical Reasoning':
        testPage = LogicalReasoningPage(
          onSubmit: (score, timeElapsed) {
            // Handle the onSubmit callback if needed
          },
        );
        break;
      case 'Arithmetic Aptitude':
        testPage = ArithmeticAptitudePage(
          onSubmit: (score, timeElapsed) {
            // Handle the onSubmit callback if needed
          },
        );
        break;
      default:
        throw Exception('Invalid test name: $testName');
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => testPage),
    );
  }
}
