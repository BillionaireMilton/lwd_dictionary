import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:lwd/pages/home_pag.dart';
import 'package:lwd/pages/home_page.dart';

//import 'package:flutter_splash/flutter_splash.dart';

class HomeSplashScreen extends StatefulWidget {
  @override
  _HomeSplashScreenState createState() => _HomeSplashScreenState();
}

class _HomeSplashScreenState extends State<HomeSplashScreen> {

  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => MyHomePag(),
      ));
    });
  }

  static const spinkit = SpinKitWave(
  color: Colors.white,
  size: 50.0,
  
  
);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/open.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 100,),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 30.0, 8.0, 8.0),
              child: spinkit,
              )
          ],
        ) /* add child content here */,
      ),
    );
  }
}