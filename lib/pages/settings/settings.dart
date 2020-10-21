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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(pageTitle,
          style: TextStyle(
            fontSize: width * 0.065,
          ),
        ),
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
                      style: TextStyle(
                        fontSize: width * 0.055,
                      ),
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
                              style: TextStyle(
                                fontSize: width * 0.05,
                              ),
                            ),
                          ],
                        ),
                        FlatButton(
                          color: Theme.of(context).buttonColor,
                          disabledColor: Colors.grey,
                          padding: EdgeInsets.all(10.0),
                          splashColor: Theme.of(context).primaryColor,
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
                              style: TextStyle(
                                fontSize: width * 0.05,
                              ),
                            ),
                          ],
                        ),
                        FlatButton(
                          color: Theme.of(context).buttonColor,
                          disabledColor: Colors.grey,
                          padding: EdgeInsets.all(10.0),
                          splashColor: Theme.of(context).primaryColor,
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
                            Text('Black & White Theme',
                              style: TextStyle(
                                fontSize: width * 0.05,
                              ),
                            ),
                          ],
                        ),
                        FlatButton(
                          color: Theme.of(context).buttonColor,
                          disabledColor: Colors.grey,
                          padding: EdgeInsets.all(10.0),
                          splashColor: Theme.of(context).primaryColor,
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