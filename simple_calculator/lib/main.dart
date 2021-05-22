/* providers/main.dart */
import 'package:flutter/material.dart';
import 'package:simplecalculator/index.dart';
import 'package:simplecalculator/providers/history.dart';
import 'package:simplecalculator/services/firestore.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HistoryProvider()),
        StreamProvider(create: (context) => firestoreService.getOperations()),
      ],
      child: MaterialApp(
        title: 'Calculator',
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
        themeMode: ThemeMode.dark,
        home: new IndexPage(title: 'Calculator'),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
