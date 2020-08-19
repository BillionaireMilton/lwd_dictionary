 import 'package:flutter/material.dart';
 import 'package:lwd/pages/quiz_page.dart';
 import 'package:flutter/services.dart';

 class QuizHome extends StatefulWidget {
   QuizHome({Key key}) : super(key: key);
 
   @override
   _QuizHomeState createState() => _QuizHomeState();
 }
 
 class _QuizHomeState extends State<QuizHome> {

   List<String> images = [
     'assets/pstrB.jpeg',
     'assets/pstrmp.jpg',
     'assets/pst.jpg',
   ];

   Widget customCard(String quizName, String images){
     return Padding(
       padding: EdgeInsets.all(
         20.0,
         ),
         child: InkWell(
           onTap: () {
             Navigator.of(context).pushReplacement(MaterialPageRoute(
               builder: (context) => GetJson(quizName),
             ));
           },
           child: Padding(
             padding: const EdgeInsets.only(bottom: 0.0, top: 0.0,),
             child: Material(
               color: Colors.blue,
               elevation: 10.0,
               borderRadius: BorderRadius.circular(20.0),
               child: Padding(
                 padding: const EdgeInsets.only(bottom: 10.0, top: 10.0,),
                 child: Container(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10.0
                         ),
                         child: Material(
                           elevation: 10.0,
                           borderRadius: BorderRadius.circular(100.0),
                           child: Container(
                             height: 200.0,
                             width: 200.0,
                             child: Padding(
                               padding: const EdgeInsets.all(1.0),
                               child: ClipOval(
                                 child: Image(
                                   fit: BoxFit.cover,
                                   image: AssetImage(
                                     images,
                                     
                                  ),
                                ),
                               ),
                             )
                           ),
                         ),
                        ),
                        Center(
                          child: Text(
                            quizName,
                            style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.white,
                              fontFamily: "Alike",
                            ),
                          ),
                        )
                      ],
                    ),
                 ),
               ),
          ),
           )
        ),
      );
   }

   @override
   Widget build(BuildContext context) {
     SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown, DeviceOrientation.portraitUp
    ]);
     return Scaffold(
        appBar: AppBar(
          title: Text(
            "Loveworld Quiz",
            style: TextStyle(
              fontFamily: "Quando",
            ),
          )
        ),
        body: ListView(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 20),
            ),
            customCard("Bible Words Quiz", images[0]),
            customCard("Ministry Program", images[1]),
            customCard("Pastor Chris Quotes Quiz", images[2]),

          ],
          
                  ),
               );
             }
           }
          
 