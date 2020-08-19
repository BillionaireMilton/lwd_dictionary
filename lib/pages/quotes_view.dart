import 'package:flutter/material.dart';
import 'package:lwd/pages/qtst.dart';
import 'package:lwd/pages/quotes_page.dart';
import 'package:lwd/pages/words_page.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:lwd/functions/material_color.dart';
//import 'myflexiableappbar.dart';
//import 'myappbar.dart';
//import 'package:flutter_sparkline/flutter_sparkline.dart';

class QuotesViewPage extends StatefulWidget {
  final Qinfo qinfo;
  const QuotesViewPage(this.qinfo);

  @override
  _QuotesViewPageState createState() => _QuotesViewPageState();
}

enum TtsState { playing, stopped, paused, continued }


class _QuotesViewPageState extends State<QuotesViewPage> {

  String _newVoiceText;

  TtsState ttsState = TtsState.stopped;

  get isPlaying => ttsState == TtsState.playing;

  get isStopped => ttsState == TtsState.stopped;

  get isPaused => ttsState == TtsState.paused;

  get isContinued => ttsState == TtsState.continued;

  @override
  Widget build(BuildContext context) {
    final FlutterTts flutterTts = FlutterTts();
    

      Future _speakWord(String word) async {
      await flutterTts.setLanguage("en-US");
      await flutterTts.setPitch(1);
       await flutterTts.speak(word);
      }
      
    Future _speakMeaning(String meaning) async {
      await flutterTts.setLanguage("en-US");
      await flutterTts.setPitch(1);
      // await flutterTts.speak(meaning);

      _newVoiceText = meaning;
      if (_newVoiceText != null) {
      if (_newVoiceText.isNotEmpty) {
        var result = await flutterTts.speak(_newVoiceText);
        if (result == 1) setState(() => ttsState = TtsState.playing);
      }
    }
      
    }

    Future stopMeaning() async {
      var result = await flutterTts.stop();
      if (result == 1) setState(() => ttsState = TtsState.stopped);
    }
    
    // Future<bool> onBackPressed() {
    //  return flutterTts.stop();
    // }

    return Scaffold(
      appBar: AppBar(
         title: Column(
           children: <Widget>[
             Text(widget.qinfo.category_name),
           ],
         ), 
       ),
        body: CustomScrollView(
    slivers:<Widget>[

      SliverList(
        delegate: SliverChildListDelegate(
          <Widget>[
             Container(

      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Card(
              child: Container(
                child: Image.asset('assets/pastor.jpg'),
              ),
            ),

             Card(
              color: Colors.lightGreen[100],
              
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      
                         // Synonyms [Title]
                       Row(
                         children: <Widget>[

                           Container(

                            alignment: Alignment.center,
                            child: Text(
                              "Pastor Said",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic,
                                
                                
                               
                              ),
                              
                            ),
                           ),

                            SizedBox(width: 20,),

                            Container(
                              alignment: Alignment.bottomLeft,
                              child: IconButton(
                                icon: 
                                isPlaying ? Icon(
                                  Icons.volume_off,
                                  color: Colors.indigo[300],
                                  size: 30.0,
                                ) : Icon(
                                  Icons.volume_up,
                                  color: Colors.indigo[300],
                                  size: 30.0,
                                ),
                                
                                onPressed: () {
                                  isPlaying ? stopMeaning() : _speakMeaning(widget.qinfo.qte);
                                },
                                
                              ),
                            ),
                         ],
                       ),

                      // Synonyms [content]
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            widget.qinfo.qte,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),


                    ],
                  ),
                  ),
              ),
            ),


          Card(
              color: Colors.indigo[200],
              
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      
                         // Excerpt [Title]
                       Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Excerpt",
                          
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic,
                            
                            
                           
                          ),
                          
                        ),
                      ),

                      // Excerpt [content]
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 7.0, 0.0, 8.0),
                          child: Text(
                            widget.qinfo.author_name,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),


                    ],
                  ),
                  ),
              ),
            ),


          ],
        ),
      ),
    )
    
  
          ],
        ),
      )
    ],
        ),
    );
  }
}