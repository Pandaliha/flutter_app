import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/menu/menu.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/pages/books/util.dart' as util;
import 'package:flutter_app/pages/books/goodreads_api.dart';
import 'package:xml/xml.dart' as xml;

const pageTitle = 'Books';

class Books extends StatefulWidget {

  const Books({Key key}) : super(key: key);
  @override
  _BooksState createState() => _BooksState();
}

class _BooksState extends State<Books> {
  TextEditingController _controller = TextEditingController();
  String searchterm;
  //Filter _filter = Filter.all;
  final _formKey = GlobalKey<FormState>();
  String dropdownValue = 'all';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle,
          style: TextStyle(
            fontSize: width * 0.065,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: Menu(),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.only(left: width * 0.1, right: width * 0.1, top: width * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Enter title or author',
                        hintStyle: TextStyle(fontSize: 18),
                        border: OutlineInputBorder(),
                        //icon: Icon(Icons.search),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                     Text('Search ', style: TextStyle(
                        fontSize: width * 0.05,
                      ),
                      ),
                    DropdownButton<String>(
                      value: dropdownValue,
                      icon: Icon(Icons.arrow_drop_down, size: 30.0,),
                      iconSize: 28,
                      elevation: 16,
                      style: TextStyle(color: Theme.of(context).cursorColor, fontSize: width * 0.05),
                      underline: Container(
                        height: 2,
                        color: Theme.of(context).accentColor,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                      items: <String>['all', 'title', 'author']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 24.0)),
                    FlatButton(
                          color: Theme.of(context).buttonColor,
                          disabledColor: Colors.grey,
                          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                          splashColor: Theme.of(context).primaryColor,
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              // TODO
                              if (dropdownValue == 'title') {
                              } else if (dropdownValue == 'author') {
                              } else {
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: width * 0.1, right: width * 0.1, top: width * 0.04),
                                  child: FutureBuilder(
                                      future: getBooks(util.appKey, searchterm, 1),
                                      builder: (context, snapshot) {
                                        Map jsonData = snapshot.data;
                                        print('\n GET BOOKS: \n' + jsonData.toString() + '\n');

                                        if (snapshot.hasData) {
                                          /*var result = xml.parse(snapshot.body);
                                          var bookElements = result.findAllElements('book');*/
                                          return Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              // TODO if true
                                            ],
                                          );
                                        } else {
                                          return Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                ],
                                              ),
                                              SizedBox(
                                                height: width * 0.009,
                                              ),
                                              SizedBox(
                                                height: width * 0.17,
                                              ),
                                            ],
                                          );
                                        }
                                      }),
                                );
                              }
                            }
                          },
                          child: Icon(Icons.search, size: 28.0,)
                      ),
                  ],
                ),
              ),



                ],
              ),
            ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
