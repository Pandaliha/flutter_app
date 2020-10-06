import 'package:flutter/material.dart';
import 'package:flutter_app/pages/menu/menu.dart';
import 'package:flutter_app/style/custom_theme.dart';
import 'package:flutter_app/style/themes.dart';

const pageTitle = 'Settings';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  void _changeTheme(BuildContext buildContext, MyThemeKeys key) {
    CustomTheme.instanceOf(buildContext).changeTheme(key);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(pageTitle, style: Theme.of(context).textTheme.headline5),
      ),
      drawer: Menu(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text('Change Theme',
                      style: Theme.of(context).textTheme.headline6),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Container(
                                color: Color(0xff8BC34A),
                                width: 15,
                                height: 15,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Container(
                                color: Color(0xffFFEB3B),
                                width: 15,
                                height: 15,
                              ),
                            ),
                            Text('Light Theme',
                                style: Theme.of(context).textTheme.subtitle1),
                          ],
                        ),
                        RaisedButton(
                          onPressed: () {
                            _changeTheme(context, MyThemeKeys.LIGHT);
                          },
                          child: Icon(Icons.refresh),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Container(
                                color: Colors.deepPurple,
                                width: 15,
                                height: 15,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Container(
                                color: Color(0xffFF4081),
                                width: 15,
                                height: 15,
                              ),
                            ),
                            Text('Dark Theme',
                                style: Theme.of(context).textTheme.subtitle1),
                          ],
                        ),
                        RaisedButton(
                          onPressed: () {
                            _changeTheme(context, MyThemeKeys.DARK);
                          },
                          child: Icon(Icons.refresh),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Container(
                                color: Colors.black,
                                width: 15,
                                height: 15,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Container(
                                color: Colors.grey[400],
                                width: 15,
                                height: 15,
                              ),
                            ),
                            Text('Black, White & Grey Theme',
                                style: Theme.of(context).textTheme.subtitle1),
                          ],
                        ),
                        RaisedButton(
                          onPressed: () {
                            _changeTheme(context, MyThemeKeys.BW);
                          },
                          child: Icon(Icons.refresh),
                        ),
                      ],
                    ),
                  ),

                  Divider(height: 100,),
                ],
              ),
          ),
        ],
      ),
    );
  }
}