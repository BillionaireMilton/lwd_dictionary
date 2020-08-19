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
import 'package:lwd/functions/material_color.dart';
import 'package:lwd/functions/quiz_splash.dart';
import 'package:lwd/functions/quotes_splash.dart';
import 'package:lwd/pages/categories_page.dart';
import 'package:lwd/pages/feedbacks.dart';
import 'package:lwd/pages/messages_page.dart';
import 'package:lwd/pages/quotes_daily_page.dart';
import 'package:lwd/pages/quotes_page.dart';
//import 'package:lwd/pages/feedback.dart';
//import 'package:lwd/pages/feedbacks.dart';
//import 'package:lwd/pages/words_page.dart';
//import 'package:lwd/functions/quiz_splash.dart';
//import 'package:lwd/pages/notes_page.dart';

import 'home_page.dart';

class QuotesMenuPage extends StatefulWidget {
  QuotesMenuPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _QuotesMenuPageState createState() => _QuotesMenuPageState();
}

class _QuotesMenuPageState extends State<QuotesMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
            children: <Widget>[
              Text("Pastor Chris Quotes"),
            ],
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/quote_menu.png'),
                  fit: BoxFit.fill)),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  SizedBox(height: 80.00),
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
                                  debugPrint('Quotes');
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => QuotesPage()));
                                },
                                child: Image.asset('assets/quote_icon.png'),
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
                              margin:
                                  const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                              child: FlatButton(
                                padding: const EdgeInsets.all(8.0),
                                onPressed: () {
                                  debugPrint('Messages');
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MessagesPage()));
                                },
                                child: Image.asset('assets/quote_exe.png'),
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
                                  debugPrint('Category');
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CategoriesPage()));
                                },
                                child: Image.asset('assets/qcat_icon.png'),
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
                                  debugPrint('Quote of the day');
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              QuotesDailyPage()));
                                },
                                child: Image.asset('assets/quotes_daily.png'),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Spacer(flex: 1,)
                  SizedBox(height: 80.00),
                ],
              ),
            ),
          ),
        ));
  }
}
