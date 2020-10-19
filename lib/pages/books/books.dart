import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/menu/menu.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/pages/books/util.dart' as util;
import 'package:flutter_app/pages/books/goodreads_api.dart';
import 'package:flutter_app/pages/books/book_model.dart';
import 'package:flutter_app/pages/books/book_details.dart';

const pageTitle = 'Books';

class Books extends StatefulWidget {
  const Books({Key key}) : super(key: key);

  @override
  _BooksState createState() => _BooksState();
}

class _BooksState extends State<Books> {
  TextEditingController _controller = TextEditingController();
  String searchterm;

  final _formKey = GlobalKey<FormState>();
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

    Book bookResult;

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
                                    if (dropdownValue == 'title') {
                                    } else if (dropdownValue == 'author') {
                                    } else {
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: width * 0.1,
                                            right: width * 0.1,
                                            top: width * 0.04),
                                        child: FutureBuilder(
                                            future: getBooks(util.appKey, searchterm, 1),
                                            builder: (context, snapshot) {
                                              Map jsonData = snapshot.data;
                                              Map bookArray = jsonData['GoodreadsResponse']['search']['results']['work'];

                                              if (snapshot.hasData) {

                                                return ListView.builder(
                                                  itemCount: 2,
                                                  itemBuilder: (context, position) {
                                                    return ListTile(
                                                        title: Text('${bookArray[position]['best_book']['title']['\$t']}'),
                                                        //subtitle: Text('${bookArray[position]['best_book'].author}'),
                                                        /*leading:
                                                        onTap: () => _onTapItem(context, items[position]),*/
                                                    );
                                                  },
                                                );

                                                return ListView.builder(
                                                  physics: BouncingScrollPhysics(),
                                                  scrollDirection: Axis.horizontal,
                                                  itemCount: 5,
                                                  itemBuilder: (context, index) {
                                                    return VerticalBookCard(

                                                      book: bookArray[index]['best_book'],
                                                      title: bookArray[index]['best_book']['title'],
                                                      imageUrl: bookArray[index]['best_book']['imageUrl'],
                                                    );
                                                  },
                                                );

                                              } else {
                                                return Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Row(
                                                      children: <Widget>[
                                                        SizedBox(
                                                          height: width * 0.009,
                                                        ),
                                                        Center(child: CircularProgressIndicator()),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// TODO
class VerticalBookCard extends StatelessWidget {
  final Book book;
  final String title;
  final String imageUrl;

  VerticalBookCard({this.imageUrl, this.title, this.book});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookDetails(
                  book: book,
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 150,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[200],
                    blurRadius: 6,
                    spreadRadius: 1,
                  ),
                ],
              ),
            ),
          ),
        ),
        Text(
          title,
          style: TextStyle(
            color: Colors.deepPurple,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
