import 'package:flutter/material.dart'
    show
        AppBar,
        AssetImage,
        BoxDecoration,
        BoxFit,
        BuildContext,
        Center,
        Column,
        Container,
        CrossAxisAlignment,
        DecorationImage,
        EdgeInsets,
        FlatButton,
        Image,
        Key,
        MainAxisAlignment,
        MaterialPageRoute,
        Navigator,
        Scaffold,
        State,
        StatefulWidget,
        Text,
        Widget,
        Card,
        Colors,
        debugPrint;
import 'package:flutter/src/widgets/basic.dart';
import 'package:lwd/functions/home_splash.dart';
import 'package:lwd/functions/quotes_splash.dart';
import 'package:lwd/pages/feedback.dart';
import 'package:lwd/pages/feedbacks.dart';
import 'package:lwd/pages/tst.dart';
import 'package:lwd/pages/words_page.dart';
import 'package:lwd/functions/quiz_splash.dart';
import 'package:lwd/pages/notes_page.dart';

import 'home_page.dart';

class MyHomePag extends StatefulWidget {
  MyHomePag({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePagState createState() => _MyHomePagState();
}

class _MyHomePagState extends State<MyHomePag> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/menu_page.jpg'), fit: BoxFit.fill)),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SizedBox(height: 110.00),
              Flexible(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      child: Card(
                        shadowColor: Colors.indigo[50],
                        elevation: 5,
                        child: Container(
                          height: 180,
                          child: FlatButton(
                            padding: const EdgeInsets.all(8.0),
                            onPressed: () {
                              debugPrint('Dictionary');
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WordsPage()));
                            },
                            child: Image.asset('assets/Dictionary2.png'),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Card(
                        shadowColor: Colors.indigo[50],
                        elevation: 5,
                        child: Container(
                          height: 180,
                          margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                          child: FlatButton(
                            padding: const EdgeInsets.all(8.0),
                            onPressed: () {
                              debugPrint('Games');
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => QuizSplashScreen(),
                                  ));
                            },
                            child: Image.asset('assets/Games2.png'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Flexible(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      child: Card(
                        //color: Colors.indigo[50],
                        shadowColor: Colors.indigo[50],
                        elevation: 5,
                        child: Container(
                          height: 180,
                          child: FlatButton(
                            padding: const EdgeInsets.all(8.0),
                            onPressed: () {
                              debugPrint('Quotes');
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => QuotesSplashScreen(),
                                  ));
                            },
                            child: Image.asset('assets/Quotes2.png'),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Card(
                        shadowColor: Colors.indigo[50],
                        elevation: 5,
                        child: Container(
                          height: 180,
                          child: FlatButton(
                            padding: const EdgeInsets.all(8.0),
                            onPressed: () {
                              debugPrint('FeedBacks');
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FeedBacksPage(),
                                  ));
                            },
                            child: Image.asset('assets/contrib.png'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
                SizedBox(height: 100.00),
              // Spacer(flex: 1,)
            ],
          ),
        ),
      ),
    ));
  }
}
