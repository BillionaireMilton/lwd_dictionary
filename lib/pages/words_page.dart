import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WordsPage extends StatefulWidget {
  WordsPage({Key key}) : super(key: key);

  @override
  _WordsPageState createState() => _WordsPageState();
}

class _WordsPageState extends State<WordsPage> {

   var wordsUrl = "http://api.loveworlddictionary.org/words/all.php";
  //var wordsUrl = 'https://jsonplaceholder.typicode.com/photos';
  Map mapResponse;
  List wordsList;



    Future fetchData()async {
      http.Response response;
      response = await http.get(wordsUrl);


      // Map<String, dynamic> map = json.decode(response.body);
      // List<dynamic> wordsList = map["records"];
      
      if (response.statusCode == 200) {
         setState(() {
        mapResponse = json.decode(response.body);
        wordsList = mapResponse['records'];
      });
      }
     
      // print(wordsList[10]['word']);
      //print(wordsList);
    }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("Words"),
         actions: <Widget>[
           InkWell(
             child: SizedBox(
               width: 100.0,
               child: Icon(
                 Icons.search,
                 
                 ),

                 
             ),
           ),
           
         ],
         
       ),
       
       body: 
       
       mapResponse != null ?ListView.builder(
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.only(left: 6.0),
                
                child: ListTile(
                  dense: true,
                  
                   title: Text(wordsList[index]['word'],
                   
                   style: TextStyle(
                     fontSize: 24,
                     fontWeight: FontWeight.bold 
                   ),
                   )
                ),
              );
            },
            itemCount: wordsList.length,
            )
          : Center(child: CircularProgressIndicator(),
      ),
    );
  }
}