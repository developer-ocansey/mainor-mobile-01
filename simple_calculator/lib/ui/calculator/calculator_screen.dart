import 'package:flutter/material.dart';
import 'package:simplecalculator/components/display.dart';
import 'package:simplecalculator/components/key_pad.dart';
import 'package:simplecalculator/processor/controller.dart';
import 'package:simplecalculator/processor/index.dart';
import 'package:simplecalculator/routes.dart';

class Calculator extends StatefulWidget {
  Calculator({Key key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output;

  @override
  void initState() {
    KeyController.listen((event) => Processor.process(event));
    Processor.listen((data) => setState(() {
          _output = data;
        }));
    Processor.refresh();
    super.initState();
  }

  @override
  void dispose() {
    KeyController.dispose();
    Processor.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;

    double buttonSize = screen.width / 4;
    double displayHeight = screen.height - (buttonSize * 5) - (buttonSize);

    return Scaffold(
      backgroundColor: Color.fromARGB(196, 32, 64, 96),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Display(value: _output, height: displayHeight),
            KeyPad(),
            ElevatedButton(
              child: Text('History'),
              onPressed: () {
                Navigator.pushReplacementNamed(context, Routes.history);
              },
            ),
          ]),
    );
  }
}
