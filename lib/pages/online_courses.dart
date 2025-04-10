// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:aspirearc/components/drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnlineCourses extends StatelessWidget {
  const OnlineCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF4ECF7),
        title: Text(
          'Online Courses',
          style: GoogleFonts.poppins(),
        ),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      backgroundColor: Color(0xffF8F9F9),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              courseTile(
                context,
                imagePath: 'lib/assets/prog.png',
                titleLines: ['Programming'],
                onTapRoute: '/programming',
              ),
              SizedBox(height: 20),
              courseTile(
                context,
                imagePath: 'lib/assets/android.png',
                titleLines: ['Mobile', 'Development'],
              ),
              SizedBox(height: 20),
              courseTile(
                context,
                imagePath: 'lib/assets/bussiness.png',
                titleLines: ['Business', 'Analytics'],
              ),
              SizedBox(height: 20),
              courseTile(
                context,
                imagePath: 'lib/assets/web.png',
                titleLines: ['Web', 'Development'],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget courseTile(BuildContext context,
      {required String imagePath,
      required List<String> titleLines,
      String? onTapRoute}) {
    return SizedBox(
      height: 120,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (onTapRoute != null) {
            Navigator.pushNamed(context, onTapRoute);
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 6,
          shadowColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Image.asset(
                imagePath,
                height: 60,
              ),
            ),
            SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: titleLines
                  .map((line) => Text(
                        line,
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
     