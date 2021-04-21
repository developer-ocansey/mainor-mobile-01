import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simplecalculator/index.dart';

void main() => runApp(new App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Calculator',
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
      home: new IndexPage(title: 'Calculator'),
      debugShowCheckedModeBanner: false,
    );
  }
}
