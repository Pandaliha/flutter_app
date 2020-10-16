import 'package:flutter/material.dart';
import 'package:flutter_app/pages/menu/menu.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter_app/pages/books/util.dart' as util;

const pageTitle = 'Books';

class Books extends StatefulWidget {
  final String latitude,longitude;

  const Books({Key key, this.latitude, this.longitude}) : super(key: key);
  @override
  _BooksState createState() => _BooksState();
}

class _BooksState extends State<Books> {
  TextEditingController _controller = TextEditingController();
  String searchterm;

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
                TextField(
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
      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
