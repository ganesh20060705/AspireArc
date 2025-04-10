// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:aspirearc/components/drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF8F9F9),
        title: Text(
          'Home',
          style: GoogleFonts.poppins(letterSpacing: 0.3, fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      backgroundColor: Color(0xffF8F9F9),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Wrap(
            spacing: 30, // space between buttons horizontally
            runSpacing: 30, // space between buttons vertically
            children: [

              // Resume Button
              _buildMenuButton(
                context,
                title: 'Resume',
                icon: Icons.description_outlined,
                onPressed: () {},
              ),

              // Career Suggestion Button
              _buildMenuButton(
                context,
                title: 'Career\nSuggestion',
                icon: Icons.wallet_travel_rounded,
                onPressed: () {
                  Navigator.pushNamed(context, '/job');
                },
              ),

              // Aptitude Test Button
              _buildMenuButton(
                context,
                title: 'Aptitude\nTest',
                icon: Icons.assignment_rounded,
                onPressed: () {
                  Navigator.pushNamed(context, '/prevhome');
                },
              ),

              // Online Courses Button
              _buildMenuButton(
                context,
                title: 'Online\nCourses',
                icon: Icons.card_membership_rounded,
                onPressed: () {
                  Navigator.pushNamed(context, '/onlinecourses');
                },
              ),

              // ATS Scanner Button
              _buildMenuButton(
                context,
                title: 'ATS\nScanner',
                icon: Icons.qr_code_2_rounded,
                onPressed: () {
                  Navigator.pushNamed(context, '/atspage');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context,
      {required String title,
      required IconData icon,
      required VoidCallback onPressed}) {
    return SizedBox(
      height: 150,
      width: 150,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 10,
          shadowColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.black),
            SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
