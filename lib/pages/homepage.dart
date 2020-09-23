import 'package:flutter/material.dart';
import 'menu.dart';

const pageTitle = 'Home';

class Homepage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle, style: Theme.of(context).textTheme.headline5),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: Menu(),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                leading: Icon(Icons.album),
                title: Text('Placeholder'),
                subtitle: Text('Placeholder Description.'),
              ),
             /* ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: const Text('BUY TICKETS'),
                    onPressed: () {*//* ... *//*},
                  ),
                  FlatButton(
                    child: const Text('LISTEN'),
                    onPressed: () {*//* ... *//*},
                  ),
                ],
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}