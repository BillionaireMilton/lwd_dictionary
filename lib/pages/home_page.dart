import 'package:flutter/material.dart' show AppBar, AssetImage, BoxDecoration, BoxFit, BuildContext, Center, Column, Container, CrossAxisAlignment, DecorationImage, EdgeInsets, FlatButton, Image, Key, MainAxisAlignment, MaterialPageRoute, Navigator, Scaffold, State, StatefulWidget, Text, Widget, debugPrint;
import 'package:lwd/pages/words_page.dart';



class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Container(
        
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Page 3 CORRECTED PLAIN.jpg'),
            fit: BoxFit.cover
          )
          
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            
            children: <Widget>[
              Container(
                height: 90,
                child: FlatButton(
                  padding: const EdgeInsets.only(left: -9),
                  onPressed: (){
                    debugPrint('Dictionary');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WordsPage()
                      )
                    );
                  },
                  child: Image.asset('assets/DD.png'),
                ),
              ),
              Container(
                height: 90, 
                margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                child: FlatButton(
                  padding: const EdgeInsets.only(left: -9),
                  onPressed: (){
                    debugPrint('Quotes');
                  },
                  child: Image.asset('assets/QQ.png'),
                ),
                
              ),
              
              Container(
                height: 90,
                child: FlatButton(
                  padding: const EdgeInsets.only(left: -9),
                  onPressed: (){
                    debugPrint('Games');
                  },
                  child: Image.asset('assets/GG.png'),
                ),
              ),
              Container(
                height: 90,
                child: FlatButton(
                  padding: const EdgeInsets.only(left: -9),
                  onPressed: (){
                    debugPrint('Notes');
                  },
                  child: Image.asset('assets/NN.png'),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 50),
                height: 90,
                child: FlatButton(
                  padding: const EdgeInsets.only(left: -9),
                  onPressed: (){
                    debugPrint('Feedbacks');
                  },
                  child: Image.asset('assets/GG.png'),
                ),
              ),
              // Spacer(flex: 1,)
            ],
          ),
        ),
      )
    );
  }
}
