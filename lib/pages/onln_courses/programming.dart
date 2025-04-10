import 'package:aspirearc/components/drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Programming extends StatelessWidget {
  const Programming({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF4ECF7),
        title: Text(
          'Programming Courses',
          style: GoogleFonts.poppins(),
        ),
        centerTitle: true,
      ),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                height: 70,
                // width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xffE8DAEF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Introduction To C',
                            style: GoogleFonts.poppins(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'Great Learning',
                            style: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'FREE',
                            style: GoogleFonts.poppins(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                height: 70,
                // width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xffE8DAEF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            
                            child: Text(
                              
                              'The Complete Python Developer',
                              style: GoogleFonts.poppins(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Text(
                            
                            'Udemy',
                            style: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '₹649',
                            style: GoogleFonts.poppins(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                height: 70,
                // width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xffE8DAEF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Java Programming',
                            style: GoogleFonts.poppins(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'Great Learning',
                            style: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'FREE',
                            style: GoogleFonts.poppins(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                height: 70,
                // width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xffE8DAEF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Introduction to C++',
                            style: GoogleFonts.poppins(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'Simplilearn',
                            style: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'FREE',
                            style: GoogleFonts.poppins(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                height: 70,
                // width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xffE8DAEF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Advanced Python Projects',
                            style: GoogleFonts.poppins(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'Great Learning',
                            style: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'FREE',
                            style: GoogleFonts.poppins(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _launchURL() async {
    final Uri url = Uri.parse('https://www.mygreatlearning.com/academy/learn-for-free/courses/c-for-beginners1');
    print('Attempting to launch $url');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
      print('Successfully launched $url');
    } else {
      print('Could not launch $url');
      throw 'Could not launch $url';
    }
  }
}
