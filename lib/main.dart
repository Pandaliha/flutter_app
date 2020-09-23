import 'package:flutter/material.dart';
import 'pages/homepage.dart';
import 'pages/about.dart';
import 'pages/settings.dart';
import 'style/custom_theme.dart';
import 'style/themes.dart';

// void main() => runApp(MyApp());

void main() {
  runApp(
    CustomTheme(
      initialThemeKey: MyThemeKeys.LIGHT,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Homepage(),
        '/about': (context) => About(),
        '/settings': (context) => Settings(),
      },
      theme: CustomTheme.of(context),
    );
  }
}