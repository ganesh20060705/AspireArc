import 'package:flutter/material.dart';
import 'package:aspirearc/pages/resumes/templates/template1.dart';
import 'package:aspirearc/pages/resumes/pdf_generator.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String phone = '';
  String experience = '';
  String education = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resume Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                onSaved: (value) => name = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                onSaved: (value) => email = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Phone'),
                onSaved: (value) => phone = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Experience'),
                onSaved: (value) => experience = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Education'),
                onSaved: (value) => education = value!,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  _formKey.currentState!.save();
                  await generatePdf(name, email, phone, experience, education);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResumeTemplateOne(
                        name: name,
                        email: email,
                        phone: phone,
                        experience: experience,
                        education: education,
                      ),
                    ),
                  );
                },
                child: const Text('Generate Resume'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
