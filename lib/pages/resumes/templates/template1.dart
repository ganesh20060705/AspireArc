import 'package:flutter/material.dart';

class ResumeTemplateOne extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final String experience;
  final String education;

  const ResumeTemplateOne({super.key, 
    required this.name,
    required this.email,
    required this.phone,
    required this.experience,
    required this.education,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resume Template 1'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: $name', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('Email: $email', style: const TextStyle(fontSize: 16)),
            Text('Phone: $phone', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            const Text('Experience:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(experience, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            const Text('Education:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(education, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
