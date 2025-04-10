// ignore_for_file: prefer_const_constructors

import 'package:aspirearc/pages/home_page.dart';
import 'package:aspirearc/pages/jobs.dart';
import 'package:aspirearc/pages/online_courses.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xffF4ECF7),
      child: ListView(
        children: [
          DrawerHeader(
              child: Center(
                  child: Text(
            'AspireArc',
            style: GoogleFonts.poppins(
                fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 3.0),
          ))),
          ListTile(
            leading: Icon(
              Icons.home_rounded,
              color: Color(0xffAD51D3),
            ),
            title: Text(
              'Home',
              style: GoogleFonts.poppins(letterSpacing: 1.5),
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.wallet_travel_rounded,
              color: Color(0xffAD51D3),
            ),
            title: Text(
              'Job Recommendation',
              style: GoogleFonts.poppins(letterSpacing: 1.5),
            ),
            onTap: () {
              
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Job()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.assignment_rounded,
              color: Color(0xffAD51D3),
            ),
            title: Text(
              'Aptitude Test',
              style: GoogleFonts.poppins(letterSpacing: 1.5),
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Job()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.assignment_rounded,
              color: Color(0xffAD51D3),
            ),
            title: Text(
              'Online Courses',
              style: GoogleFonts.poppins(letterSpacing: 1.5),
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => OnlineCourses()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.logout_rounded,
              color: Color(0xffAD51D3),
            ),
            title: Text(
              'Logout',
              style: GoogleFonts.poppins(letterSpacing: 1.5),
            ),
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }
}
