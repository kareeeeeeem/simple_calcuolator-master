import 'package:flutter/material.dart';

void main() => runApp(Calculator());

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: CalculatorHomePage(),
    );
  }
}

class CalculatorHomePage extends StatefulWidget {
  @override
  _CalculatorHomePageState createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  double num1 = 0.0, num2 = 0.0, result = 0.0;
  String operator = '';

  void calculate() {
    if (operator == '+') {
      result = num1 + num2;
    } else if (operator == '-') {
      result = num1 - num2;
    } else if (operator == '*') {
      result = num1 * num2;
    } else if (operator == '/') {
      result = num1 / num2;
    }
  }

  void buttonPressed(String buttonText) {
    if (buttonText == 'C') {
      setState(() {
        num1 = 0.0;
        num2 = 0.0;
        result = 0.0;
        operator = '';
      });
    } else if (buttonText == '+' || buttonText == '-' || buttonText == '*' || buttonText == '/') {
      setState(() {
        operator = buttonText;
      });
    } else if (buttonText == '=') {
      setState(() {
        calculate();
      });
    } else {
      setState(() {
        if (operator == '') {
          num1 = double.parse(buttonText);
        } else {
          num2 = double.parse(buttonText);
        }
      });
    }
  }

  Widget buildButton(String buttonText) {
    return MaterialButton(
      padding: EdgeInsets.all(24.0),
      onPressed: () => buttonPressed(buttonText),
    
      child: Text(buttonText.toString()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(24.0),
              alignment: Alignment.bottomRight,
              child: Text(
                '$result',
                style: TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              buildButton('7'),
              buildButton('8'),
              buildButton('9'),
              buildButton('/'),
            ],
          ),
          Row(
            children: <Widget>[
              buildButton('4'),
              buildButton('5'),
              buildButton('6'),
              buildButton('*'),
            ],
          ),
          Row(
            children: <Widget>[
              buildButton('1'),
              buildButton('2'),
              buildButton('3'),
              buildButton('-'),
            ],
          ),
          Row(
            children: <Widget>[
              buildButton('.'),
              buildButton('0'),
              buildButton('00'),
              buildButton('+'),
            ],
          ),
          Row(
            children: <Widget>[
              buildButton('C'),
              buildButton('='),
            ],
          ),
        ],
      ),
    );
  }

  OutlineButton({required EdgeInsets padding, required void Function() onPressed, required Text child}) {}
}
