import 'dart:async';
//import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:lwd/functions/material_color.dart';
import 'package:lwd/functions/quiz_home.dart';
import 'package:lwd/pages/result_page.dart';

class GetJson extends StatelessWidget {
  //const GetJson({Key key @required this.quizName}) : super(key: key);

  String quizName;
  GetJson(this.quizName);
  String assetToLoad;

  // a function
  // sets the asset to a particular JSON file
  // and opens the JSON
  setAsset() {
    if (quizName == "Bible Words Quiz") {
      assetToLoad = "assets/json/bible.json";
    } else if (quizName == "Ministry Program") {
      assetToLoad = "assets/json/ministry.json";
    } else {
      assetToLoad = "assets/json/quotes.json";
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown, DeviceOrientation.portraitUp
    ]);
    setAsset();
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString(assetToLoad, cache: true),
      // initialData: InitialData,
      builder: (context, snapshot) {
        List mydata = json.decode(snapshot.data.toString());
        if (mydata == null){
          return Scaffold(
            body: Center(
              child: Text(
                "Loading...",
              ),
            )
          );
        } else {
          return QuizPage(mydata: mydata);
        }
      },
    );
  }
}

class QuizPage extends StatefulWidget {
  QuizPage({Key key, @required this.mydata}) : super(key: key);

  var mydata;
   
  @override
  _QuizPageState createState() => _QuizPageState(mydata);
}

class _QuizPageState extends State<QuizPage> {

  var mydata;
  _QuizPageState(this.mydata);

  Color colorToShow = Colors.blue;
  Color right = Colors.green;
  Color wrong = Colors.red;
  int marks = 0;
  int i = 1;
  int timer = 30;
  String showTimer = "30";

    // extra varibale to iterate
  int j = 1;
  var randomArray;
  

  Map<String, Color> btnColor = {
    "a": Colors.blue,
    "b": Colors.blue,
    "c": Colors.blue,
    "d": Colors.blue,
  };

  bool cancelTimer = false;

    // code inserted for choosing questions randomly
  // to create the array elements randomly use the dart:math module
  // -----     CODE TO GENERATE ARRAY RANDOMLY

  getRandomArray(){
    var distinctIds = [];
    var rand = new Random();
      for (int i = 1; ;) {
      distinctIds.add(rand.nextInt(10) + 1);
        randomArray = distinctIds.toSet().toList();
        if(randomArray.length < 10 ){
          continue;
        }else{
          break;
        }
      }
      print(randomArray);
  }



  @override
  void initState() { 
    startTimer();
    getRandomArray();
    super.initState();
    
  }

    // overriding the setstate function to be called only if mounted
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  void startTimer() async {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer t){
      if(mounted){
        setState(() {
        if(timer < 1){
          t.cancel();
          nextQuestion();
        } else if(cancelTimer == true){
          t.cancel();
        } else {
          timer = timer -1;
        }
        showTimer = timer.toString();
      });
      }
      
    }
    );
  }

  void nextQuestion(){
    cancelTimer = false;
    timer = 31;
    if (mounted) {
      setState((){
        // j=1;
      if(j < 10){
        i = randomArray[j];
        j++;
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => ResultPage(marks: marks),
            )
          );
      }
      btnColor["a"] = Colors.blue;
      btnColor["b"] = Colors.blue;
      btnColor["c"] = Colors.blue;
      btnColor["d"] = Colors.blue;
    });
    startTimer();
    }
  }
  
  void checkAnswer(String k) {
    if(mydata[2][i.toString()] == mydata[1][i.toString()][k]){
      marks = marks + 5;
      colorToShow = right;
    } else {
      colorToShow = wrong;
    }
    setState(() {
      btnColor[k] = colorToShow;
      cancelTimer = true;

    });

    Timer(Duration(seconds: 1), nextQuestion);
  }

  Widget choiceButtons(String k){
    return i !=null ? Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: MaterialButton(
        onPressed: () => checkAnswer(k),
        child: Text(
          //i.toString() !=null ? mydata[1][i.toString()][k]
         // mydata[1][i.toString()][k],
          mydata[1][i.toString()??'1'][k]??'',
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Alike",
            fontSize: 16.0,
          ),
          ),
          color: btnColor[k],
          splashColor: Colors.white,
          highlightColor: Colors.indigo, 
          minWidth: 300.0,
          height: 45.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0)
          ),
        ),
    ) : Container();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown, DeviceOrientation.portraitUp
    ]);
    return Scaffold(
     body: Padding(
       
       padding: const EdgeInsets.all(20.0),
       child: Column(
         children: <Widget>[
           
           Expanded(
             flex: 1,
             child: Card(
               color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 35.0, 0),
                  alignment: Alignment.centerRight,
                  child: Text(
                    showTimer,
                    style: TextStyle(
                    fontSize: 35.0,
                    fontFamily: "Times New Roman",
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                     ),
                   ),
                  ),
                ),
               ),
             ),
            Expanded(
             flex: 3,
             child: Card(
               shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
               color: Colors.teal[400],
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
               child: Container(
                  padding: EdgeInsets.fromLTRB(9.0, 0, 9.0, 0),
                  alignment: Alignment.center,
                  child: Text(
                    mydata[0][i.toString()]??'',
                    
                    style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: "Quando",
                    //fontWeight: FontWeight.bold,
                    color: Colors.white
                     ),
                   ),
                ),
                ),
               ),
             ),
            Expanded(
            flex: 6,
             child: Card(
               shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
               color: createMaterialColor(Color(0xFF101149)),
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
               child: Expanded(
                                child: Container(
                    padding: EdgeInsets.fromLTRB(9.0, 0, 9.0, 0),
                    alignment: Alignment.center,
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                       choiceButtons("a"),
                       choiceButtons("b"),
                       choiceButtons("c"),
                       choiceButtons("d"),
                     ],
                   ),
                   
                  ),
               ),
                ),
               ),
             ),
          ],
        ),
     ),
    );
  }
}