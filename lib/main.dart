import 'package:flutter/material.dart';
import 'package:myapp/questions_screen.dart';
import 'package:myapp/result_screen.dart';
import 'package:myapp/start_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [Colors.purple, Colors.deepPurple],
          ),
        ),
        child:  const StartScreen(),
      ),
    ),
  ));
}
