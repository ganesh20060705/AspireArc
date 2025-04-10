// ignore_for_file: depend_on_referenced_packages

import 'package:aspirearc/components/drawer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class ATSPage extends StatefulWidget {
  const ATSPage({super.key});

  @override
  _ATSPageState createState() => _ATSPageState();
}

class _ATSPageState extends State<ATSPage> {
  TextEditingController jobDescController = TextEditingController();
  File? _file;
  String _response = "";

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'png', 'jpg', 'jpeg'],
    );

    if (result != null) {
      setState(() {
        _file = File(result.files.single.path!);
      });
    }
  }

  Future<void> _uploadFile(String prompt) async {
    if (_file == null || jobDescController.text.isEmpty) {
      setState(() {
        _response = "Please provide a job description and upload a file.";
      });
      return;
    }

    var request = http.MultipartRequest('POST', Uri.parse('http://10.0.2.2:5000/analyze')); // Update with your local IP
    request.fields['input_text'] = jobDescController.text;
    request.fields['prompt'] = prompt;
    request.files.add(await http.MultipartFile.fromPath('file', _file!.path, filename: basename(_file!.path)));

    var res = await request.send();

    if (res.statusCode == 200) {
      var responseBody = await res.stream.bytesToString();
      setState(() {
        _response = jsonDecode(responseBody)['response'];
      });
    } else {
      setState(() {
        _response = "Error: ${res.statusCode}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ATS Resume Expert'),
      ),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: jobDescController,
                decoration: const InputDecoration(labelText: 'Job Description'),
                maxLines: null, // Allows any number of lines
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _pickFile,
                child: const Text('Pick File'),
              ),
              const SizedBox(height: 20),
              _file != null ? Text('Selected file: ${basename(_file!.path)}') : const Text('No file selected.'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _uploadFile(_inputPrompt1),
                child: const Text('Tell Me About the Resume'),
              ),
              ElevatedButton(
                onPressed: () => _uploadFile(_inputPrompt2),
                child: const Text('How can I Improve my Skills'),
              ),
              ElevatedButton(
                onPressed: () => _uploadFile(_inputPrompt3),
                child: const Text('What are the Keywords that are Missing'),
              ),
              ElevatedButton(
                onPressed: () => _uploadFile(_inputPrompt4),
                child: const Text('Percentage Match'),
              ),
              const SizedBox(height: 20),
              _response.isNotEmpty
                  ? Container(decoration: BoxDecoration(color: const Color(0xffF4ECF7),borderRadius: BorderRadius.circular(10)),child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MarkdownBody(data: _response),
                  ),)
                  : const Text('No response yet.'),
            ],
          ),
        ),
      ),
    );
  }

  String get _inputPrompt1 => """
  You are an experienced Technical Human Resource Manager. Your task is to review the provided resume against the job description. 
  Please share your professional evaluation on whether the candidate's profile aligns with the role. 
  Highlight the strengths and weaknesses of the applicant in relation to the specified job requirements. 
  """;

  String get _inputPrompt2 => """
  You are an experienced career coach. Please review the provided resume and suggest areas for improvement in terms of skills. 
  Recommend specific skills and qualifications that the candidate should acquire to better align with the job description.
  """;

  String get _inputPrompt3 => """
  You are a skilled ATS (Applicant Tracking System) scanner with a deep understanding of data science and ATS functionality. 
  Your task is to evaluate the resume against the provided job description. 
  Give me the percentage of match if the resume matches the job description. 
  First, the output should come as percentage, then keywords missing, and last final thoughts.
  """;

  String get _inputPrompt4 => """
  You are a skilled ATS (Applicant Tracking System) scanner with a deep understanding of data science and ATS functionality. 
  Your task is to evaluate the resume against the provided job description. 
  Give me the percentage of match if the resume matches the job description. 
  Provide a detailed analysis of the resume's strengths and weaknesses in relation to the job description.
  """;
}
