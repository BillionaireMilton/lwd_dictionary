import 'package:flutter/material.dart';
import 'package:lwd/pages/tst.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:lwd/functions/material_color.dart';
//import 'myflexiableappbar.dart';
//import 'myappbar.dart';
//import 'package:flutter_sparkline/flutter_sparkline.dart';

class DetailPage extends StatefulWidget {
  final Info info;
  const DetailPage(this.info);

  @override
  _DetailPageState createState() => _DetailPageState();
}

enum TtsState { playing, stopped, paused, continued }


class _DetailPageState extends State<DetailPage> {

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
        //if (result == 1) setState(() => ttsState = TtsState.playing);
        if (result == 1) {
          setState(() => ttsState = TtsState.playing);
        } else {
          setState(() => ttsState = TtsState.stopped);
        }
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
        body: CustomScrollView(
    slivers:<Widget>[
      SliverAppBar(
        // title: Text(
        //   info.word,
        // ),
        expandedHeight: 180.0,
        floating: true,
          pinned: true,
          snap: true,
          actionsIconTheme: IconThemeData(opacity: 0.0),
          flexibleSpace: Stack(
            children: <Widget>[
              FlexibleSpaceBar(
                  centerTitle: true,
                  title: Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
                    child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                    text: widget.info.word[0],
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat Black',
                      color: Colors.white.withOpacity(0.3)
                      ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '\n',
                        style: TextStyle(
                          fontSize: 1,
                          
                        ),
                      ),
                      TextSpan(
                        text: widget.info.word,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Montserrat Light',
                          color: Colors.white
                        ),
                      ),
                    ]
              ),
            ),
                  ),
                  
                  background: Image.asset(
                    "assets/BAR2.jpg",
                    fit: BoxFit.fill,
                  ),
              )
              
            ],
          ),
      ),

      SliverList(
        delegate: SliverChildListDelegate(
          <Widget>[
             Container(
               color: Colors.blue[50],
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Card(
              color: Colors.white,
              
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      
                      Padding(
                        padding: const EdgeInsets.fromLTRB(9.0, 8.0, 8.0, 0.0),
                        child: Container(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                widget.info.word,
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                        
                        ),

                        // The Word And Pronunciation [Title]
                       Padding(
                         padding: const EdgeInsets.fromLTRB(3.0, 0.0, 8.0, 0.0),
                         child: Row(
                           children: <Widget>[

                             // The Word
                            //  Container(
                            //   alignment: Alignment.bottomLeft,
                            //   child: Text(
                            //     widget.info.word,
                            //     style: TextStyle(
                            //       fontSize: 22,
                            //       fontWeight: FontWeight.w700,
                            //     ),
                            //   ),
                            // ),

                            // SizedBox(width: 20,),

                            // Pronunciation
                            Container(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                widget.info.pronunciation,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),

                            SizedBox(width: 80,),

                            Container(
                              alignment: Alignment.bottomLeft,
                              child: IconButton(
                                icon: Icon(
                                Icons.volume_up,
                                color: Colors.indigo[300],
                                size: 30.0,
                                ),
                                onPressed: () => _speakWord(widget.info.word),
                                
                              ),
                            ),

                           ],
                         ),
                       ),

                      SizedBox(height: 0,),

                      // The Meaning [Title]
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                            child: Container(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                "Definition",
                                
                                style: TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.w500,
                                  
                                  
                                 
                                ),
                                
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
                                  isPlaying ? stopMeaning() : _speakMeaning(widget.info.meaning);
                                },
                                
                              ),
                            ),
                        ],
                      ),

                      // The meaning [content]
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.info.meaning,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),

                        // Examples [Title]
                       Padding(
                         padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                         child: Container(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "",
                            
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic,
                              
                              
                             
                            ),
                            
                          ),
                      ),
                       ),

                      // Examples [content]


                      Padding(
                         padding: const EdgeInsets.fromLTRB(9.0, 0.0, 9.0, 15.0),
                         child: Container(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            widget.info.examples,
                            
                            style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                              
                              
                             
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
              color: Colors.lightGreen[100],
              
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      
                         // Synonyms [Title]
                       Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Synonyms",
                          
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic,
                            
                            
                           
                          ),
                          
                        ),
                      ),

                      // Synonyms [content]
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            widget.info.synonyms,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
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
              color: Colors.red[100],
              
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      
                         // Antonyms [Title]
                       Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Antonyms",
                          
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic,
                            
                            
                           
                          ),
                          
                        ),
                      ),

                      // Antonyms [content]
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            widget.info.antonyms,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
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
                            widget.info.excerpt,
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