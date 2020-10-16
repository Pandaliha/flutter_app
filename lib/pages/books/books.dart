import 'package:flutter/material.dart';
import 'package:flutter_app/pages/menu/menu.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/pages/books/util.dart' as util;

const pageTitle = 'Books';

class Books extends StatefulWidget {

  const Books({Key key}) : super(key: key);
  @override
  _BooksState createState() => _BooksState();
}


enum Filter { all, title, author}

class _BooksState extends State<Books> {
  TextEditingController _controller = TextEditingController();
  String searchterm;
  Filter _filter = Filter.all;
  final _formKey = GlobalKey<FormState>();

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

                  /*Text('Search for: ', style: TextStyle(
                    fontSize: width * 0.055,
                  ),),*/
                  /*ListTile(
                    title: const Text('All'),
                    leading: Radio(
                      value: Filter.all,
                      groupValue: _filter,
                      onChanged: (Filter value) {
                        setState(() {
                          _filter = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Title'),
                    leading: Radio(
                      value: Filter.title,
                      groupValue: _filter,
                      onChanged: (Filter value) {
                        setState(() {
                          _filter = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Author'),
                    leading: Radio(
                      value: Filter.author,
                      groupValue: _filter,
                      onChanged: (Filter value) {
                        setState(() {
                          _filter = value;
                        });
                      },
                    ),
                  ),*/
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: FlatButton(
                        color: Theme.of(context).buttonColor,
                        disabledColor: Colors.grey,
                        padding: EdgeInsets.all(10.0),
                        splashColor: Theme.of(context).primaryColor,
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          // Process data.
                        }
                      },
                      child: Icon(Icons.search) //Text('Submit'),
                    ),
                  ),
                ],
              ),
            ),

                /*TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter title or author',
                    icon: Icon(Icons.search),
                  ),
                controller: _controller,
                onSubmitted: (String searchterm) async {
                  await showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      // TODO
                      return Text(
                        'To DO',
                        style: TextStyle(
                          fontSize: width * 0.05,
                        ),
                      );
                    },
                  );
                },
      ),*/

              ],
            ),
          ),
        ),
      ),
    );
  }
}
