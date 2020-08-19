import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/menu_page.jpg'),
            fit: BoxFit.fill
          ),
          
        ),

        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Card(
                  child: FlatButton(
                    padding: const EdgeInsets.all(8.0),
                      onPressed: (){
                        debugPrint('Games');
                      },
                    child: Image.asset('assets/Games2.png'),
                    
                    ),
                  
                ),

                Card(
                  child: FlatButton(
                    padding: const EdgeInsets.all(8.0),
                      onPressed: (){
                        debugPrint('Games');
                      },
                    child: Image.asset('assets/Games2.png'),
                    
                    ),
                  
                ),

              ],
            ),

            Row(
              children: <Widget>[
                Card(
                  child: FlatButton(
                    padding: const EdgeInsets.all(8.0),
                      onPressed: (){
                        debugPrint('Games');
                      },
                    child: Image.asset('assets/Games2.png'),
                    
                    ),
                  
                ),

                Card(
                  child: FlatButton(
                    padding: const EdgeInsets.all(8.0),
                      onPressed: (){
                        debugPrint('Games');
                      },
                    child: Image.asset('assets/Games2.png'),
                    
                    ),
                  
                ),
                
              ],
            ),

            
          ],
        ),
      ),
    );
  }
}