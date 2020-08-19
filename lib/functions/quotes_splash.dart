import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:lwd/pages/home_pag.dart';
import 'package:lwd/pages/quotes_menu_page.dart';

//import 'package:flutter_splash/flutter_splash.dart';

class QuotesSplashScreen extends StatefulWidget {
  @override
  _QuotesSplashScreenState createState() => _QuotesSplashScreenState();
}

class _QuotesSplashScreenState extends State<QuotesSplashScreen> {

  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => QuotesMenuPage(),
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
            image: AssetImage("assets/quotessplash.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 100,),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 40.0),
              child: spinkit,
              )
          ],
        ) /* add child content here */,
      ),
    );
  }
}