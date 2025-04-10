// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:aspirearc/components/bgimage.dart';
import 'package:aspirearc/components/button.dart';
import 'package:aspirearc/components/textfield.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();

  void signupuser() async {
    try {
      if (_passwordController.text != _confirmPwController.text) {
        throw 'Passwords do not match';
      }

      // Create user with email and password
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Update display name
      await userCredential.user!.updateDisplayName(_usernameController.text);

      // Navigate to homepage
      Navigator.pushReplacementNamed(context, '/homepage');
    } catch (error) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text(error.toString()),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double horizontalPadding = screenWidth < 400 ? 20.0 : 50.0;

    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: 30.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 100),
                    Text(
                      'SIGN UP',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 33,
                        color: Color(0xffAD51D3),
                      ),
                    ),
                    SizedBox(height: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomTextField(
                          controller: _usernameController,
                          labelText: 'Username',
                          suffixIcon: Icon(Icons.person, color: Color(0xffAD51D3)),
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          controller: _emailController,
                          labelText: 'Email',
                          suffixIcon: Icon(Icons.email, color: Color(0xffAD51D3)),
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          controller: _passwordController,
                          labelText: 'Create password',
                          obscureText: true,
                          suffixIcon: Icon(Icons.lock_outline, color: Color(0xffAD51D3)),
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          controller: _confirmPwController,
                          labelText: 'Confirm Password',
                          obscureText: true,
                          suffixIcon: Icon(Icons.lock_outline, color: Color(0xffAD51D3)),
                        ),
                        SizedBox(height: 30),
                        MyButton(
                          onTap: signupuser,
                          text: 'Sign Up',
                        ),
                        SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account? ",
                              style: TextStyle(fontSize: 16, color: Color(0xffF4ECF7)),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/login');
                              },
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffAD51D3),
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
