// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:aspirearc/components/bgimage.dart';
import 'package:aspirearc/components/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  void getstarted() {
    Navigator.pushNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 300.0),
              child: Column(
                children: [
                  Text(
                    'ASPIRE ARC',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 33,
                        color: Color(0xffF4ECF7)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'Embark on a seamless journey to professional growth. AspireArc is your trusted partner in navigating the arc of your career, offering personalized tools and insights to help you achieve your highest aspirations. Let’s begin the path to your future success.',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Color(0xffF4ECF7),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  MyButton(onTap:(){
                    Navigator.pushNamed(context, '/login');
                      
                  }, text: 'Get Started')
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
