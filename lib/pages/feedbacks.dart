import 'package:flutter/material.dart';
import 'package:lwd/functions/countries.dart';
import 'package:lwd/functions/material_color.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lwd/pages/home_pag.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:dropdownfield/dropdownfield.dart';

class FeedBacksPage extends StatefulWidget {
  FeedBacksPage({Key key}) : super(key: key);

  @override
  _FeedBacksPageState createState() => _FeedBacksPageState();
}

class _FeedBacksPageState extends State<FeedBacksPage> {
  final _formKey = GlobalKey<FormState>();

  // Getting value from TextFormField widget.
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final countryController = TextEditingController();
  final phoneController = TextEditingController();
  final churchController = TextEditingController();
  final wordController = TextEditingController();
  final meaningController = TextEditingController();
  final excerptController = TextEditingController();

  // Boolean variable for CircularProgressIndicator.
  bool visible = false;

  Future webCall() async {
    // Showing CircularProgressIndicator using State.
    setState(() {
      visible = true;
    });

    // Getting value from Controller
    String name = nameController.text;
    String email = emailController.text;
    String country = countryController.text;
    String phone = phoneController.text;
    String church = churchController.text;
    String word = wordController.text;
    String meaning = meaningController.text;
    String excerpt = excerptController.text;

    // API URL
    var url = "http://api.loveworlddictionary.org/words/feedbacks.php";

    // Store all data with Param Name.
    var data = {
      'name': name,
      'email': email,
      'country': country,
      'phone': phone,
      'church': church,
      'word': word,
      'meaning': meaning,
      'excerpt': excerpt,
    };

    // Starting Web Call with data.
    var response = await http.post(url, body: json.encode(data));

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If Web call Success than Hide the CircularProgressIndicator.
    if (response.statusCode == 200) {
      setState(() {
        visible = false;
      });
    }

    // Showing Alert Dialog with Response JSON.
    showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 20.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          //backgroundColor: Colors.indigo[100],
          title: Text('LoveWorld Dictionary'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  message,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Quando',
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => MyHomePag(),
                ));
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 20.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          //backgroundColor: Colors.indigo[100],
          title: Text('LoveWorld Dictionary'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  "Could not Send your Contribution",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Quando',
                    //color: Colors.red,
                  ),
                ),
                Text(''),
                Text('Please fill all fields appropriately'),
                Text(''),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Try Again'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  String selectedCountry = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.indigoAccent,
      body: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          // title: Text(
          //   info.word,
          // ),
          expandedHeight: 10.0,
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
                        text: '\n',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat Black',
                            color: Colors.white.withOpacity(0.3)),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Loveworld Dictionary',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          TextSpan(
                            text: '',
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Montserrat Light',
                                color: Colors.white),
                          ),
                          TextSpan(
                            text: '',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Montserrat Light',
                              color: Colors.white,
                            ),
                          ),
                        ]),
                  ),
                ),
                background: Image.asset(
                  "assets/feedback3.png",
                  fit: BoxFit.fill,
                ),
              )
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            <Widget>[
              Card(
                color: Colors.white,
                child: SingleChildScrollView(
                    child: Center(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text('Contribute a Word',
                              style: TextStyle(
                                fontSize: 22,
                                color: createMaterialColor(Color(0xFF300649)),
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat Black',
                              )),
                        ),
                        Container(
                            width: 350,
                            padding: EdgeInsets.all(10.0),
                            child: TextFormField(
                              controller: nameController,
                              autocorrect: true,
                              decoration: InputDecoration(
                                hintText: 'Enter Name Here',
                                icon: Icon(Icons.person),
                                labelText: 'Full Name',
                                border: OutlineInputBorder(),
                                //errorText: 'Error Text',
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please Enter Your Full  Name';
                                }
                                return null;
                              },
                            )),
                        Container(
                            width: 350,
                            padding: EdgeInsets.all(10.0),
                            child: TextFormField(
                              controller: emailController,
                              autocorrect: true,
                              decoration: InputDecoration(
                                hintText: 'Enter Email Here',
                                icon: Icon(Icons.mail),
                                labelText: 'Email',
                                border: OutlineInputBorder(),
                                //errorText: 'Error Text',
                              ),
                              validator: validateEmail,
                            )),
                        Container(
                            width: 350,
                            padding: EdgeInsets.all(10.0),
                            child: DropDownField(
                              controller: countryController,
                              //autocorrect: true,
                              // decoration: InputDecoration(
                              hintText: 'Enter Country Here',
                              icon: Icon(Icons.map),
                              labelText: 'Country',
                              items: countries,
                              itemsVisibleInDropdown: 5,
                              onValueChanged: (value) {
                                setState(() {
                                  selectedCountry = value;
                                });
                              },
                              //border: OutlineInputBorder(),
                              //errorText: 'Error Text',
                              //),
                              // validator: (value) {
                              //   if (value.isEmpty) {
                              //     return 'Please Enter Your Country';
                              //   }
                              //   return null;
                              // },
                            )),
                        Container(
                            width: 350,
                            padding: EdgeInsets.all(10.0),
                            child: TextFormField(
                              controller: phoneController,
                              autocorrect: true,
                              decoration: InputDecoration(
                                hintText: 'Enter Phone Number Here',
                                icon: Icon(Icons.phone),
                                labelText: 'Phone Number',
                                border: OutlineInputBorder(),
                                //errorText: 'Error Text',
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please Enter Your Phone Number';
                                }
                                return null;
                              },
                            )),
                        Container(
                            width: 350,
                            padding: EdgeInsets.all(10.0),
                            child: TextFormField(
                              controller: churchController,
                              autocorrect: true,
                              decoration: InputDecoration(
                                hintText: 'Enter Church Here',
                                icon: Icon(Icons.home),
                                labelText: 'Church',
                                border: OutlineInputBorder(),
                                //errorText: 'Error Text',
                              ),
                            )),
                        Container(
                            width: 350,
                            padding: EdgeInsets.all(10.0),
                            child: TextFormField(
                              controller: wordController,
                              autocorrect: true,
                              decoration: InputDecoration(
                                hintText: 'Enter Word Here',
                                icon: Icon(Icons.input),
                                labelText: 'Word',
                                border: OutlineInputBorder(),
                                //errorText: 'Error Text',
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please Enter Suggested Word';
                                }
                                return null;
                              },
                            )),
                        Container(
                            width: 350,
                            padding: EdgeInsets.all(10.0),
                            child: TextFormField(
                              controller: meaningController,
                              autocorrect: true,
                              decoration: InputDecoration(
                                hintText: 'Enter Meaning Here',
                                icon: Icon(Icons.comment),
                                labelText: 'Meaning',
                                border: OutlineInputBorder(),
                                //errorText: 'Error Text',
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please Enter Meaning Of Word';
                                }
                                return null;
                              },
                            )),
                        Container(
                            width: 350,
                            padding: EdgeInsets.all(10.0),
                            child: TextFormField(
                              controller: excerptController,
                              autocorrect: true,
                              decoration: InputDecoration(
                                hintText: 'Where Pastor Defined the word',
                                icon: Icon(Icons.compare),
                                labelText: 'Excerpt',
                                border: OutlineInputBorder(),
                                //errorText: 'Error Text',
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please Where did Pastor Defined the word';
                                }
                                return null;
                              },
                            )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            onPressed: () {
                              if (countryController != null &&
                                  _formKey.currentState.validate()) {
                                webCall();
                              } else {
                                _showMyDialog();
                              }
                            },
                            color: createMaterialColor(Color(0xFF300649)),
                            textColor: Colors.white,
                            padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                            child: Text('Submit'),
                          ),
                        ),
                        Visibility(
                            visible: visible,
                            child: Container(
                                margin: EdgeInsets.only(bottom: 30),
                                child: CircularProgressIndicator())),
                      ],
                    ),
                  ),
                )),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
