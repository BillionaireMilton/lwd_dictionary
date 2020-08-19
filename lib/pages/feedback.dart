import 'package:flutter/material.dart';

class FeedBackPage extends StatefulWidget {
  FeedBackPage({Key key}) : super(key: key);

  @override
  _FeedBackPageState createState() => _FeedBackPageState();
}

class _FeedBackPageState extends State<FeedBackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
       appBar: AppBar(
         title: Column(
           children: <Widget>[
             Text("Send Feedback"),
           ],
         ), 
       ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/feedbacks.jpg"),
            fit: BoxFit.cover,
          ),
        ),

        child: Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 8.0, 40.0, 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
        decoration: const InputDecoration(
          icon: Icon(Icons.person),
          hintText: 'Enter your Full Name',
          labelText: 'Full Name',
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
                ),

                TextFormField(
        decoration: const InputDecoration(
          icon: Icon(Icons.mail),
          hintText: 'Enter your email',
          labelText: 'Email',
          focusColor: Colors.black,
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
                ),

                TextFormField(
        decoration: const InputDecoration(
          icon: Icon(Icons.map),
          hintText: 'Select your Country',
          labelText: 'Country',
          focusColor: Colors.black,
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
                ),

                TextFormField(
        decoration: const InputDecoration(
          icon: Icon(Icons.home),
          hintText: 'Your Church',
          labelText: 'Church',
          focusColor: Colors.black,
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
                ),

                TextFormField(
        decoration: const InputDecoration(
          icon: Icon(Icons.book),
          hintText: 'Enter Suggested Word',
          labelText: 'Word',
          focusColor: Colors.black,
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
                ),

                TextFormField(
        keyboardType: TextInputType.multiline,
        maxLines: 2,
        maxLength: 1000,
        decoration: const InputDecoration(
            icon: Icon(Icons.book),
            hintText: 'Enter Meaning',
            labelText: 'Meaning',
            focusColor: Colors.black,
          ),
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ),

        TextFormField(
        decoration: const InputDecoration(
          icon: Icon(Icons.explore),
          hintText: 'Where Pastor Defined the word',
          labelText: 'Excerpt',
          focusColor: Colors.black,
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
                ),

                Padding(
              padding: const EdgeInsets.all(3.0),
              child: RaisedButton(
                onPressed: () {
        // Validate will return true if the form is valid, or false if
        // the form is invalid.
        //if (_formKey.currentState.validate()) {
          // Process data.
        //}
                },
                child: Text('Submit'),
              ),
            ),
              ],
            ),
          ),
      ),
    );
  }
}