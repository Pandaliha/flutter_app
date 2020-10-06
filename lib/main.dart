import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'pages/home/homepage.dart';
import 'pages/about.dart';
import 'pages/settings/settings.dart';
import 'style/custom_theme.dart';
import 'style/themes.dart';

// void main() => runApp(MyApp());

void main() {
  initializeDateFormatting('en_EN',null).then((_){
  runApp(
    CustomTheme(
      initialThemeKey: MyThemeKeys.LIGHT,
      child: MyApp(),
    ),
  );
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/about': (context) => About(),
        '/settings': (context) => Settings(),
      },
      theme: CustomTheme.of(context),
    );
  }
}