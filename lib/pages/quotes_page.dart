import 'package:flutter/material.dart';
import 'dart:async';
import 'package:lwd/models/Quote.dart';
import 'package:lwd/pages/detail_page.dart';
import 'package:lwd/pages/details_page.dart';
import 'package:lwd/pages/quote_view.dart';
import 'package:lwd/services/Services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class QuotesPage extends StatefulWidget {
  QuotesPage({Key key}) : super(key: key);

  final String title = "Pastor Chris Quotes";

  @override
  _QuotesPageState createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {
  List<Quote> quotes = List();
  List<Quote> filteredQuotes = List();

  @override
  void initState() {
    super.initState();
    QuoteServices.getQuotes().then((quotesFromServer) {
      setState(() {
        quotes = quotesFromServer;
        filteredQuotes = quotes;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(
                        5.0,
                      ),
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white60,
                  contentPadding: EdgeInsets.all(15.0),
                  hintText: 'Search Quotes'),
              onChanged: (string) {
                //
                setState(() {
                  filteredQuotes = quotes
                      .where((q) =>
                          (q.qte.toLowerCase().contains(string.toLowerCase()) ||
                              q.category_name
                                  .toLowerCase()
                                  .contains(string.toLowerCase()) ||
                              q.author_name
                                  .toLowerCase()
                                  .contains(string.toLowerCase())))
                      .toList();
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: filteredQuotes.length,
              itemBuilder: (BuildContext context, int index) {
                if (quotes == null) {
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                    child: Container(
                      height: 120,
                      child: InkWell(
                          child: Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Column(
                              children: <Widget>[
                                // Category name______________________________
                                Container(
                                  alignment: Alignment.bottomLeft,
                                  //color: Colors.blue,
                                  child: Card(
                                    color: Colors.blue[200],
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        filteredQuotes[index].category_name,
                                        //maxLines: 2,
                                        //overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,

                                        style: TextStyle(
                                          fontSize: 10,
                                          //fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                // Quotes Row______________________________
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        8.0, 4.0, 2.0, 0.0),
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          // Quotes image name______________________________
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                2.0, 4.0, 5.0, 0.0),
                                            child: Container(
                                              height: 50,
                                              width: 50,
                                              child: ClipOval(
                                                child: Image(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(
                                                    'assets/pst.jpg',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),

                                          // Quotes qte______________________________

                                          Expanded(
                                            child: Container(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        2.0, 2.0, 2.0, 0.0),
                                                child: Container(
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  width: 280,
                                                  child: Text(
                                                    filteredQuotes[index].qte,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    softWrap: false,
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                      //fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                // Message name______________________________
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.bottomRight,
                                    //color: Colors.blue,
                                    child: Card(
                                      color: Colors.green[200],
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          filteredQuotes[index].author_name,
                                          //maxLines: 2,
                                          //overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,

                                          style: TextStyle(
                                            fontSize: 10,
                                            //fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            elevation: 5,
                            margin: EdgeInsets.all(0),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) =>
                                      QuoteViewPage(filteredQuotes[index])),
                            );
                          }),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
