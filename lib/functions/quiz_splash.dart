import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lwd/functions/quiz_home.dart';

class QuizSplashScreen extends StatefulWidget {
  @override
  _QuizSplashScreenState createState() => _QuizSplashScreenState();
}

class _QuizSplashScreenState extends State<QuizSplashScreen> {

  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => QuizHome(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Text(
          "Loveworld Quiz",
          style: TextStyle(
            fontFamily: "Quando",
            fontSize: 45.0,
            color: Colors.white,
          ),
        ),
        )

    );
  }
}