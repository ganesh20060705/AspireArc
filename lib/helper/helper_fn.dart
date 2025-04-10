import 'package:flutter/material.dart';
//to display error msg to user
void DisplayMessageToUser(String message,BuildContext context){
  showDialog(
    context: context, 
    builder: (context) => AlertDialog(
      title: Text(message),
    ),
  );
}