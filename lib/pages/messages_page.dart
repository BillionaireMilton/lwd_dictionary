 import 'package:flutter/material.dart';
import 'dart:async';
import 'package:lwd/models/Message.dart';
import 'package:lwd/pages/messages_list_page.dart';
import 'package:lwd/pages/detail_page.dart';
import 'package:lwd/pages/details_page.dart';
import 'package:lwd/services/Services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class MessagesPage extends StatefulWidget {
  MessagesPage({Key key}) : super(key: key);

  final String title = "Messages";

  @override
  _MessagesPageState createState() => _MessagesPageState();
} 

class _MessagesPageState extends State<MessagesPage> {

  List<Message> messages = List();
  List<Message> filteredMessages = List();
  

  @override
  void initState() {
    super.initState();
    MessageServices.getMessages().then((messagesFromServer) {
      setState(() {
        messages = messagesFromServer;
        filteredMessages = messages;
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
                hintText: 'Search Messages'
              ),
              onChanged: (string) {
                //
                setState(() {
                  filteredMessages = messages.where((w) => 
                  (w.name.toLowerCase().contains(string.toLowerCase())),
                  ).toList();
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: filteredMessages.length,
              
              itemBuilder: (BuildContext context, int index) {
                if (filteredMessages == null){
               return Container(
                 child: Center(
                   child: CircularProgressIndicator(),
                  ),
                );
            } else {
              double c_width = MediaQuery.of(context).size.width*0.7;
                return Card(
                  child: InkWell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          
                          Padding(
                                      padding: const EdgeInsets.fromLTRB(2.0, 4.0, 10.0, 0.0),
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

                                        //SizedBox(width: 15.0),

                                        
                          
                          Flexible(
                            //width: c_width,
                            
                            child: Text(filteredMessages[index].name,
                            textAlign: TextAlign.left,
                             style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                
                            ),
                     ),
                          ),
                        ],
                      ), 
                    ),
                    onTap: (){
                       Navigator.push(
                         context, 
                         new MaterialPageRoute(
                           builder: (context) => MessageListPage(message: filteredMessages[index].name,)
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