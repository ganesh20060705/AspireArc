// ignore_for_file: depend_on_referenced_packages, prefer_final_fields, prefer_const_constructors, no_leading_underscores_for_local_identifiers

import 'dart:convert';
import 'dart:io';

import 'package:aspirearc/components/button.dart';
import 'package:aspirearc/components/drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class Job extends StatefulWidget {
  const Job({super.key});

  @override
  State<Job> createState() => _HomeState();
}

class _HomeState extends State<Job> {
  File? _image;
  TextEditingController _locationController = TextEditingController();
  List<dynamic> _jobRecommendations = [];

  Future<File?> pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      return File(image.path);
    } else {
      return null;
    }
  }

  Future<void> uploadImage(File image, String? location) async {
    final uri = Uri.parse(
        'http://10.0.2.2:5000/api'); // Ensure Flask server is accessible
    final request = http.MultipartRequest('POST', uri);

    request.files.add(await http.MultipartFile.fromPath('resume', image.path));

    if (location != null) {
      request.fields['location'] = location;
    }

    final response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final data = jsonDecode(responseBody);
      setState(() {
        _jobRecommendations = data;
      });
      print('Job Recommendations: $data');
    } else {
      print('Failed to upload image: ${response.reasonPhrase}');
    }
  }

  @override
  void dispose() {
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF4ECF7 ),
        title: Text(
          'Job Recommendation',
          
          style: GoogleFonts.poppins(),
        ),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      backgroundColor: Color(0xffF8F9F9),
      body: SingleChildScrollView(
        primary: false,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (_image == null)
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 250.0),
                      child: MyButton(
                        onTap: () async {
                          final image = await pickImage();
                          setState(() {
                            _image = image;
                          });
                        },
                        text: 'Pick Resume Image',
                      ),
                    ),
                  ),
                if (_image != null) ...[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.file(_image!, height: 200),
                      SizedBox(height: 20),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(color: Color(0xffF4ECF7),borderRadius: BorderRadius.circular(8),border: Border.all(color: Color(0xffF5EEF8))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: _locationController,
                            decoration: InputDecoration(hintText: 'Enter Location',),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      MyButton(
                        onTap: () {
                          uploadImage(_image!, _locationController.text);
                        },
                        text: 'Get Recommendations',
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
                if (_jobRecommendations.isNotEmpty) ...[
                  SizedBox(height: 20),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _jobRecommendations.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(8.0),
                        margin: EdgeInsets.symmetric(vertical: 4.0),
                        decoration: BoxDecoration(
                          color: Color(0xffF4ECF7 ),
                         // border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: ListTile(
                          title: Text(_jobRecommendations[index]['Title'],style: GoogleFonts.poppins(color:Color(0xff8E44AD),fontWeight:FontWeight.bold),),
                          subtitle: Text(_jobRecommendations[index]['Company'],style: GoogleFonts.poppins(fontWeight:FontWeight.w600)),
                          trailing: Text(_jobRecommendations[index]['Location'],style: GoogleFonts.poppins(fontWeight:FontWeight.w600)),
                        ),
                      );
                    },
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
