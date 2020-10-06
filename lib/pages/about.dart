import 'package:flutter/material.dart';
import 'menu/menu.dart';

const pageTitle = 'About';

class About extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle, style: Theme.of(context).textTheme.headline5),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: Menu(),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: RichText(
          text: TextSpan(
            text: (''),
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
      ),
    );
  }
}