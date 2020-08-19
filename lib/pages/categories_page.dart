import 'package:flutter/material.dart';
import 'dart:async';
import 'package:lwd/models/Category.dart';
import 'package:lwd/pages/categories_list_page.dart';
import 'package:lwd/pages/detail_page.dart';
import 'package:lwd/pages/details_page.dart';
import 'package:lwd/services/Services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class CategoriesPage extends StatefulWidget {
  CategoriesPage({Key key}) : super(key: key);

  final String title = "Categories";

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
} 

class _CategoriesPageState extends State<CategoriesPage> {

  List<Category> categories = List();
  List<Category> filteredCategories = List();

  @override
  void initState() {
    super.initState();
    CategoryServices.getCategories().then((categoriesFromServer) {
      setState(() {
        categories = categoriesFromServer;
        filteredCategories = categories;
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
                hintText: 'Search Categories'
              ),
              onChanged: (string) {
                //
                setState(() {
                  filteredCategories = categories.where((w) => 
                  (w.name.toLowerCase().contains(string.toLowerCase())),
                  ).toList();
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: filteredCategories.length,
              itemBuilder: (BuildContext context, int index) {
                if (filteredCategories == null){
               return Container(
                 child: Center(
                   child: CircularProgressIndicator(),
                  ),
                );
            } else {
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

                                        SizedBox(width: 15.0),
                          
                          Text(filteredCategories[index].name,
                          textAlign: TextAlign.center,
                           style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              
                          ),
                     ),
                        ],
                      ), 
                    ),
                    onTap: (){
                       Navigator.push(
                         context, 
                         new MaterialPageRoute(
                           builder: (context) => CatListPage(category: filteredCategories[index].name,)
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