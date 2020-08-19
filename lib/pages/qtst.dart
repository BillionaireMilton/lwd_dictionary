import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lwd/functions/material_color.dart';
import 'dart:convert';

import 'package:lwd/pages/detail_page.dart';
import 'package:lwd/pages/quote_view.dart';
import 'package:lwd/pages/quotes_view.dart';


class QuotesPage extends StatefulWidget {
  QuotesPage({Key key}) : super(key: key);

  @override
  _QuotesPageState createState() => _QuotesPageState();
}

 class Qinfo {
    final int index;
    final String author_name;
    final String category_name;
    final String qte;
    final String qte_fr;
    

  Qinfo(this.index, this.author_name, this.category_name, this.qte, this.qte_fr);
  }

class _QuotesPageState extends State<QuotesPage> {

  var quotesUrl = "http://api.loveworlddictionary.org/quotes/all.php";
  
  //var specific;
  Map mapResponse;
  List quotesList;

    // Future <List<Qinfo>> fetchQuotesData() async {
    //   http.Response response;
    //   response = await http.get(quotesUrl);
    // }
 

    Future <List<Qinfo>> fetchQuotesData() async {
      http.Response response;
      response = await http.get(quotesUrl);
      if (mounted){
        if (response.statusCode == 200) {
         setState(() {
        mapResponse = json.decode(response.body);
        quotesList = mapResponse['records'];
          });
        }
      }
      
      //print(quotesList);
      List<Qinfo> qinfos = [];

      for (var u in quotesList){
        Qinfo qinfo = Qinfo(u['index'], u['author_name'], u['category_name'], u['qte'], u['qte_fr']);

        qinfos.add(qinfo);
      }
      while(qinfos.length != null){
        print(qinfos.length);
        return qinfos;
      }
      
      
    }

  @override
  void initState() {
    fetchQuotesData();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  TextEditingController _controller = TextEditingController();

  _search() {}

  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
       appBar: AppBar(
         title: Column(
           children: <Widget>[
             Text("Quotes"),
           ],
         ), 
       ),
       body: Container(
         // from here
         child: FutureBuilder(
           future: fetchQuotesData(),
           builder: (BuildContext context, AsyncSnapshot snapshot){

             if (snapshot.data == null){
               return Container(
                 child: Center(
                   child: CircularProgressIndicator(),
                  ),
                );
            } else {
             return ListView.builder(
               itemCount: snapshot.data.length,
               itemBuilder: (
                 BuildContext context, int index) {
                   return ListTile(
                     dense: true,
                     title: Padding(
                       padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                       child: Container(
                         height: 120,
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
                                      snapshot.data[index].category_name,
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
                               Padding(
                                 padding: const EdgeInsets.fromLTRB(8.0, 4.0, 2.0, 0.0),
                                 child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                   children: <Widget>[

                                  // Quotes image name______________________________
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(2.0, 4.0, 5.0, 0.0),
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

                                     Padding(
                                       padding: const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 0.0),
                                       child: Container(
                                         alignment: Alignment.bottomLeft,
                                         width: 280,
                                         child: Text(
                                          
                                          snapshot.data[index].qte,
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
                                     
                                   ],
                                 ),
                               ),

                               // Message name______________________________
                               Container(
                                 alignment: Alignment.bottomRight,
                                 //color: Colors.blue,
                                 child: Card(
                                   color: Colors.green[200],
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      snapshot.data[index].author_name,
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
                             ],
                           ),
                                elevation: 5,
                                margin: EdgeInsets.all(0),
                         ),
                       ),
                     ),
                     onTap: (){
                       Navigator.push(
                         context, 
                         new MaterialPageRoute(
                           builder: (context) => QuotesViewPage(snapshot.data[index])
                           ),
                         );
                     },
                   );
                 },
               );
              }
           }
         ),
       ),
      //  mapResponse != null ?ListView.builder(
      //       itemBuilder: (context,index){
      //         return Padding(
      //           padding: const EdgeInsets.only(left: 6.0),
                
      //           child: ListTile(
      //             dense: true, 
                  
      //              title: Text(quotesList[index]['quote'],
                   
      //              style: TextStyle(
      //                fontSize: 24,
      //                fontWeight: FontWeight.bold 
      //              ),
      //              )
      //           ),
      //         );
      //       },
      //       itemCount: quotesList.length,
      //       ) 
      //    : Center(child: CircularProgressIndicator(),
      );
    // );
  }
}