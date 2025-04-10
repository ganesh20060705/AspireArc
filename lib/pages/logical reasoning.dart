import 'dart:async';
import 'package:flutter/material.dart';
import 'package:aspirearc/models/sample_questions2.dart';
import 'result_screen.dart'; // Import your result screen

typedef OnSubmit = void Function(double score, double timeElapsed);

class LogicalReasoningPage extends StatefulWidget {
  final OnSubmit onSubmit;

  const LogicalReasoningPage({super.key, required this.onSubmit});

  @override
  _LogicalReasoningPageState createState() => _LogicalReasoningPageState();
}

class _LogicalReasoningPageState extends State<LogicalReasoningPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<int?> _selectedAnswers = [];
  double score = 0;
  Stopwatch stopwatch = Stopwatch();
  late Timer timer;
  double timeElapsedInSeconds = 0;
  int currentQuestionIndex = 0;

  @override
  void initState() {
    super.initState();
    _initializeAnswersList();
    startTimer();
  }

  void _initializeAnswersList() {
    _selectedAnswers = List<int?>.filled(sampleQuestions.length, null);
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        timeElapsedInSeconds = stopwatch.elapsed.inSeconds.toDouble();
      });
    });
    stopwatch.start();
  }

  void stopTimer() {
    stopwatch.stop();
    timer.cancel();
  }

  @override
  void dispose() {
    stopwatch.stop();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LogicalReasoningPage'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Question: ${sampleQuestions[currentQuestionIndex].question}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                itemCount: sampleQuestions[currentQuestionIndex].answers.length,
                itemBuilder: (context, index) {
                  return RadioListTile<int?>(
                    title: Text(sampleQuestions[currentQuestionIndex].answers[index]),
                    value: index,
                    groupValue: _selectedAnswers[currentQuestionIndex],
                    onChanged: (value) {
                      setState(() {
                        _selectedAnswers[currentQuestionIndex] = value;
                      });
                    },
                  );
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: currentQuestionIndex > 0 ? _goToPreviousQuestion : null,
                    child: const Text('Previous'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _calculateScore();
                      }
                    },
                    child: Text(currentQuestionIndex < sampleQuestions.length - 1 ? 'Next Question' : 'Finish'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _goToPreviousQuestion() {
    setState(() {
      currentQuestionIndex--;
    });
  }

  void _calculateScore() {
    int? userAnswerIndex = _selectedAnswers[currentQuestionIndex];
    int correctAnswerIndex = sampleQuestions[currentQuestionIndex].correctAnswerIndex;
    setState(() {
      score += (userAnswerIndex == correctAnswerIndex) ? 10.0 : 0.0;
      currentQuestionIndex++;
      if (currentQuestionIndex >= sampleQuestions.length) {
        stopTimer();
        widget.onSubmit(score, timeElapsedInSeconds);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(score: score, timeElapsed: timeElapsedInSeconds),
          ),
        );
      }
    });
  }
}
