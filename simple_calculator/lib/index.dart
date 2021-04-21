
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _IndexPage createState() => new _IndexPage();
}

class _IndexPage extends State<IndexPage> {
  String output = "0";
  String _output = "0";
  double number1 = 0;
  double number2 = 0;
  String operand = "";

  calculate(String buttonText){
    if(buttonText == "C"){
      _output = "0";
      number1 = 0;
      number2 = 0;
      operand = "";
    } else if (buttonText == "+" || buttonText == "-" || buttonText == "/" || buttonText == "X"|| buttonText == "^"){

      number1 = double.parse(output);

      operand = buttonText;

      _output = "0";

    } else if(buttonText == "."){

      if(_output.contains(".")){
        return;

      } else {
        _output = _output + buttonText;
      }

    } else if (buttonText == "="){

      number2 = double.parse(output);

      if(operand == "+"){
        _output = (number1 + number2).toString();
      }
      if(operand == "-"){
        _output = (number1 - number2).toString();
      }
      if(operand == "X"){
        _output = (number1 * number2).toString();
      }
      if(operand == "/"){
        _output = (number1 / number2).toString();
      }
      if(operand == "^"){
        _output = (pow(number1, number2)).toString();
      }

      number1 = 0;
      number2 = 0;
      operand = "";

    } else {
      _output = _output + buttonText;
    }
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget Button(String buttonText) {
    return new Expanded(
      child: new MaterialButton(
        padding: new EdgeInsets.all(40.0),
        child: new Text(buttonText,
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () => calculate(buttonText)
        ,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
            child: new Column(
              children: <Widget>[
                new Container(
                    alignment: Alignment.topLeft,
                    padding: new EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 10.0
                    ),
                    decoration: BoxDecoration(color: Colors.black),
                    child: new Text('SimplCalculator.', style: new TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ))),
                new Container(
                    alignment: Alignment.centerRight,
                    decoration: BoxDecoration(color: Colors.black),
                    padding: new EdgeInsets.symmetric(
                        vertical: 70.0,
                        horizontal: 10.0
                    ),
                    child: new Text(output, style: new TextStyle(
                      fontSize: 55.0,
                      fontWeight: FontWeight.bold,

                    ))),

                new Column(children: [
                  new Row(children: [
                    Button("7"),
                    Button("8"),
                    Button("9"),
                    Button("/")
                  ]),

                  new Row(children: [
                    Button("4"),
                    Button("5"),
                    Button("6"),
                    Button("X")
                  ]),

                  new Row(children: [
                    Button("1"),
                    Button("2"),
                    Button("3"),
                    Button("-")
                  ]),

                  new Row(children: [
                    Button("."),
                    Button("0"),
                    Button("^"),
                    Button("+")
                  ]),

                  new Row(children: [
                    Button("C"),
                    Button("="),
                  ])
                ])
              ],
            )));
  }
}