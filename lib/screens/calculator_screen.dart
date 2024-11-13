import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = "0";
  String _input = "";
  double _num1 = 0;
  double _num2 = 0;
  String _operand = "";

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        _input = "";
        _output = "0";
        _num1 = 0;
        _num2 = 0;
        _operand = "";
      } else if (buttonText == "+" || buttonText == "-" || buttonText == "*" || buttonText == "/") {
        _num1 = double.parse(_output);
        _operand = buttonText;
        _input = "";
      } else if (buttonText == "=") {
        _num2 = double.parse(_input);
        if (_operand == "+") _output = (_num1 + _num2).toString();
        if (_operand == "-") _output = (_num1 - _num2).toString();
        if (_operand == "*") _output = (_num1 * _num2).toString();
        if (_operand == "/") _output = (_num1 / _num2).toString();
        _input = _output;
        _operand = "";
      } else {
        _input += buttonText;
        _output = _input;
      }
    });
  }

  Widget _buildButton(String text) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => _buttonPressed(text),
        child: Text(text, style: const TextStyle(fontSize: 24)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kalkulator Standar")),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(24),
              alignment: Alignment.bottomRight,
              child: Text(
                _output,
                style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Column(children: [
            Row(children: [_buildButton("7"), _buildButton("8"), _buildButton("9"), _buildButton("/")]),
            Row(children: [_buildButton("4"), _buildButton("5"), _buildButton("6"), _buildButton("*")]),
            Row(children: [_buildButton("1"), _buildButton("2"), _buildButton("3"), _buildButton("-")]),
            Row(children: [_buildButton("."), _buildButton("0"), _buildButton("="), _buildButton("+")]),
            Row(children: [_buildButton("C")]),
          ]),
        ],
      ),
    );
  }
}
