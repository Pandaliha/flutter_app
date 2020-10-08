import 'package:flutter/material.dart';

enum MyThemeKeys { LIGHT, DARK, BW }

class MyThemes {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: Color(0xff8BC34A),
    highlightColor: Color(0xffc6ff00),
    accentColor: Color(0xff2196f3),
    brightness: Brightness.light,
    buttonColor: Color(0xffFFEB3B),
    fontFamily: 'Lato',
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: Colors.deepPurple,
    highlightColor: Color(0xffd500f9),
    accentColor: Colors.deepPurpleAccent,
    buttonColor: Colors.deepPurple[300],
    brightness: Brightness.dark,
    fontFamily: 'Lato',
  );

  static final ThemeData bwTheme = ThemeData(
    primaryColor: Colors.black,
    highlightColor: Color(0xffeeeeee),
    accentColor:  Colors.white,
    buttonColor: Colors.grey[500],
    brightness: Brightness.dark,
    scaffoldBackgroundColor:  Colors.black,
    fontFamily: 'Lato',
  );

  static ThemeData getThemeFromKey(MyThemeKeys themeKey) {
    switch (themeKey) {
      case MyThemeKeys.LIGHT:
        return lightTheme;
      case MyThemeKeys.DARK:
        return darkTheme;
      case MyThemeKeys.BW:
        return bwTheme;
      default:
        return lightTheme;
    }
  }
}