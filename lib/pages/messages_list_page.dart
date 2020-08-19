import 'package:flutter/material.dart';
import 'package:lwd/models/Message.dart';
import 'package:lwd/models/Quote.dart';
import 'package:lwd/pages/quote_view.dart';
import 'package:lwd/services/Services.dart';

class MessageListPage extends StatefulWidget {
  final String message;
  MessageListPage({this.message});

  @override
  _MessageListPageState createState() => _MessageListPageState();
}

class _MessageListPageState extends State<MessageListPage> {
  List<Quote> _quotes = List<Quote>();
  List<Quote> _sortedQuote = List<Quote>();
  QuoteServices _sortService = QuoteServices();

  @override
  void initState() {
    super.initState();
    //getQuotesByMessages();
    MessageListServices.getMessagesList(this.widget.message)
        .then((quotesFromServer) {
      setState(() {
        _quotes = quotesFromServer;
        _sortedQuote = _quotes;
      });
    });
  }

  // getQuotesByMessages() async {
  //   var quotes = await _sortService.getMessage(this.widget.message);
  //   quotes.forEach((quotes){
  //     setState(() {
  //       var model = Quote();
  //       model.id = quotes['id'];
  //       model.message_name = quotes['message_name'];
  //       model.author_name = quotes['author_name'];
  //       model.qte = quotes['qte'];
  //       model.qte_fr = quotes['qte_fr'];

  //       _sortedQuote.add(model);
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.message),
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
                  _sortedQuote = _quotes
                      .where((q) =>
                          (q.qte.toLowerCase().contains(string.toLowerCase()) ||
                              q.author_name
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
              itemCount: _sortedQuote.length,
              itemBuilder: (BuildContext context, int index) {
                if (_sortedQuote == null) {
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
                                // Message name______________________________
                                Container(
                                  alignment: Alignment.bottomLeft,
                                  //color: Colors.blue,
                                  child: Card(
                                    color: Colors.blue[200],
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        _sortedQuote[index].category_name,
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
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
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
                                              padding: const EdgeInsets.fromLTRB(
                                                  2.0, 2.0, 2.0, 0.0),
                                              child: Container(
                                                alignment: Alignment.bottomLeft,
                                                width: 280,
                                                child: Text(
                                                  _sortedQuote[index].qte,
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
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
                                          _sortedQuote[index].author_name,
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
                                      QuoteViewPage(_sortedQuote[index])),
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
