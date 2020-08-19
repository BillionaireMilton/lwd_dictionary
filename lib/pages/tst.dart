import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:lwd/pages/detail_page.dart';


class TestPage extends StatefulWidget {
  TestPage({Key key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

enum TtsState { playing, stopped, paused, continued }




  //String _newVoiceText;

  TtsState ttsState = TtsState.stopped;

  get isPlaying => ttsState == TtsState.playing;

  get isStopped => ttsState == TtsState.stopped;

  get isPaused => ttsState == TtsState.paused;

  get isContinued => ttsState == TtsState.continued;

  

 class Info {
    final int index;
    final String word;
    final String pronunciation;
    final String meaning;
    final String examples;
    final String synonyms;
    final String antonyms;
    final String excerpt;

  Info(this.index, this.word, this.pronunciation, this.meaning, this.examples, this.synonyms, this.antonyms, this.excerpt,);
  }

class _TestPageState extends State<TestPage> {

  var wordsUrl = "http://api.loveworlddictionary.org/words/all.php";
  var meaningUrl = "http://api.loveworlddictionary.org/words/single_meaning.php?id=";
  //var specific;
  Map mapResponse;
  List wordsList;

    // Future <List<Info>> fetchData() async {
    //   http.Response response;
    //   response = await http.get(wordsUrl);
    // }
 

    Future <List<Info>> fetchData() async {
      http.Response response;
      response = await http.get(wordsUrl);
      if (mounted){
        if (response.statusCode == 200) {
         setState(() {
        mapResponse = json.decode(response.body);
        wordsList = mapResponse['records'];
          });
        }
      }
      
      //print(wordsList);
      List<Info> infos = [];

      for (var u in wordsList){
        Info info = Info(u['index'], u['word'], u['pronunciation'], u['meaning'], u['examples'], u['synonyms'], u['antonyms'], u['excerpt'],);

        infos.add(info);
      }
      while(infos.length != null){
        print(infos.length);
        return infos;
      }
      
      
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

  TextEditingController _controller = TextEditingController();

  _search() {}

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
       appBar: AppBar(
         title: Column(
           children: <Widget>[
             Text("Words"),
           ],
         ), 
       ),
       body: Container(
         // from here
         child: FutureBuilder(
           future: fetchData(),
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
                     contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                     title: Card(
                       elevation: 15.0,
                        child: Container(
                          height: 50.0,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                             snapshot.data[index].word,
                             style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                   ),
                       ),
                          ),
                        ),
                     ),
                     onTap: (){
                       Navigator.push(
                         context, 
                         new MaterialPageRoute(
                           builder: (context) => DetailPage(snapshot.data[index])
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
                  
      //              title: Text(wordsList[index]['word'],
                   
      //              style: TextStyle(
      //                fontSize: 24,
      //                fontWeight: FontWeight.bold 
      //              ),
      //              )
      //           ),
      //         );
      //       },
      //       itemCount: wordsList.length,
      //       ) 
      //    : Center(child: CircularProgressIndicator(),
      );
    // );
  }
}