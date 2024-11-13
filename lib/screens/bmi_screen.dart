import 'package:flutter/material.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({Key? key}) : super(key: key);

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double? _bmi;
  String _status = "";

  void _calculateBMI() {
    double height = double.parse(_heightController.text) / 100;
    double weight = double.parse(_weightController.text);
    setState(() {
      _bmi = weight / (height * height);
      if (_bmi! < 18.5) {
        _status = "Kurus";
      } else if (_bmi! < 24.9) {
        _status = "Normal";
      } else if (_bmi! < 29.9) {
        _status = "Overweight";
      } else {
        _status = "Obesitas";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kalkulator BMI")),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Tinggi Badan (cm)"),
            ),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Berat Badan (kg)"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateBMI,
              child: const Text("Hitung BMI"),
            ),
            const SizedBox(height: 20),
            if (_bmi != null)
              Text("BMI: ${_bmi!.toStringAsFixed(1)} - $_status",
                  style: const TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
