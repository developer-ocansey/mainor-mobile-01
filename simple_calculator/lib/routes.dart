import 'package:flutter/material.dart';
import 'package:simplecalculator/ui/calculator/calculator_screen.dart';
import 'package:simplecalculator/ui/history/history_screen.dart';
import 'package:simplecalculator/ui/splash/splash_screen.dart';

class Routes {
  Routes._();

  static const String splash = '/splash';
  static const String calculator = '/calculator';
  static const String history = '/history';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    calculator: (BuildContext context) => Calculator(),
    history: (BuildContext context) => HistoryScreen(),
  };
}
