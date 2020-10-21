import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/menu/menu.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/pages/books/util.dart' as util;
import 'package:flutter_app/pages/books/goodreads_api.dart';
import 'package:flutter_app/pages/books/book_model.dart';

const pageTitle = 'Books';

class Books extends StatefulWidget {
  const Books({Key key}) : super(key: key);

  @override
  _BooksState createState() => _BooksState();
}

class _BooksState extends State<Books> {
  final _formKey = GlobalKey<FormState>();

  String searchterm;
  String dropdownValue = 'all';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List<Book> bookResults;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          pageTitle,
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
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            searchterm = value;
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Search ',
                              style: TextStyle(
                                fontSize: width * 0.05,
                              ),
                            ),
                            DropdownButton<String>(
                              value: dropdownValue,
                              icon: Icon(
                                Icons.arrow_drop_down,
                                size: 30.0,
                              ),
                              iconSize: 28,
                              elevation: 16,
                              style: TextStyle(
                                  color: Theme.of(context).cursorColor, fontSize: width * 0.05),
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
                                    FutureBuilder(
                                        future: getBooks(util.appKey, searchterm, 1, dropdownValue),
                                        builder: (context, snapshot) {
                                          if (!snapshot.hasData || searchterm == null) {
                                            return Center(child: CircularProgressIndicator());
                                          }
                                          bookResults = snapshot.data;
                                          return Container(
                                            height: width * 0.10,
                                          );
                                        });
                                  }
                                },
                                child: Icon(
                                  Icons.search,
                                  size: 28.0,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 60,
                  child: FutureBuilder(
                      future: getBooks(util.appKey, searchterm, 1, dropdownValue),
                      builder: (context, snapshot) {
                        if (searchterm == null) {
                          return Center();
                        } else if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        }
                        bookResults = snapshot.data;
                        return ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: bookResults.length,
                          itemBuilder: (context, position) {
                            return Card(
                              child: ListTile(
                                leading: Image.network(
                                  '${bookResults[position].imageUrl}',
                                ),
                                title: Text(
                                  '${bookResults[position].title}',
                                  style: TextStyle(
                                    fontSize: width * 0.04,
                                  ),
                                ),
                                subtitle: Text(
                                  '${bookResults[position].author}',
                                  style: TextStyle(
                                    fontSize: width * 0.038,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                isThreeLine: true,
                              ),
                            );
                          },
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
