import 'package:flutter/material.dart';
import 'dart:async';
import 'package:lwd/models/Word.dart';
import 'package:lwd/pages/detail_page.dart';
import 'package:lwd/pages/details_page.dart';
import 'package:lwd/services/Services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_tts/flutter_tts.dart';


class WordsPage extends StatefulWidget {
  WordsPage({Key key}) : super(key: key);

  final String title = "Words";

  @override
  _WordsPageState createState() => _WordsPageState();
} 

enum TtsState { playing, stopped, paused, continued }

class _WordsPageState extends State<WordsPage> {

  String _newVoiceText;

  TtsState ttsState = TtsState.stopped;

  get isPlaying => ttsState == TtsState.playing;

  get isStopped => ttsState == TtsState.stopped;

  get isPaused => ttsState == TtsState.paused;

  get isContinued => ttsState == TtsState.continued;

  List<Word> words = List();
  List<Word> filteredWords = List();

  @override
      final FlutterTts flutterTts = FlutterTts();

    Future stopMeaning() async {
      var result = await flutterTts.stop();
      if (result == 0) setState(() => ttsState = TtsState.stopped);
    }

  void initState() {
    stopMeaning();
    super.initState();
    WordServices.getWords().then((wordsFromServer) {
      setState(() {
        stopMeaning();
        words = wordsFromServer;
        filteredWords = words;
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
                    const Radius.circular(5.0,
                    ),
                  ),
                ),
                filled: true,
                fillColor: Colors.white60,
                contentPadding: EdgeInsets.all(15.0),
                hintText: 'Search Words'
              ),
              onChanged: (string) {
                //
                setState(() {
                  filteredWords = words.where((w) => 
                  (w.word.toLowerCase().contains(string.toLowerCase())),
                  ).toList();
                });
              },
            ),
          ),
          
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: filteredWords.length,
              itemBuilder: (BuildContext context, int index) {
                if (filteredWords.length == 0){
               return Container(
                 child: Column(
                   children: <Widget>[
                     Center(
                       child: CircularProgressIndicator(),
                      ),
                   ],
                 ),
                );
            } else {
                return Card(
                  child: InkWell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(filteredWords[index].word,
                       style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                      ),
                     ), 
                    ),
                    onTap: (){
                       Navigator.push(
                         context, 
                         new MaterialPageRoute(
                           builder: (context) => DetailsPage(filteredWords[index])
                           ),
                         );
                     },
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