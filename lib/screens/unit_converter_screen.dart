import 'package:flutter/material.dart';

class UnitConverterScreen extends StatefulWidget {
  const UnitConverterScreen({Key? key}) : super(key: key);

  @override
  State<UnitConverterScreen> createState() => _UnitConverterScreenState();
}

class _UnitConverterScreenState extends State<UnitConverterScreen> {
  final TextEditingController _inputController = TextEditingController();
  String _fromUnit = "Meter";
  String _toUnit = "Kilometer";
  double? _result;
  String _selectedCategory = "Panjang";

  final Map<String, Map<String, double>> unitConversions = {
    "Panjang": {
      "Meter": 1,
      "Kilometer": 0.001,
      "Centimeter": 100,
      "Inch": 39.3701,
    },
    "Area": {
      "Square Meter": 1,
      "Square Kilometer": 0.000001,
      "Acre": 0.000247105,
      "Hectare": 0.0001,
    },
    "Volume": {
      "Liter": 1,
      "Milliliter": 1000,
      "Cubic Meter": 0.001,
      "Gallon": 0.264172,
    },
    "Kecepatan": {
      "Meter per Second": 1,
      "Kilometer per Hour": 3.6,
      "Miles per Hour": 2.23694,
      "Knot": 1.94384,
    },
  };

  void _convert() {
    double input = double.parse(_inputController.text);
    double fromRate = unitConversions[_selectedCategory]![_fromUnit]!;
    double toRate = unitConversions[_selectedCategory]![_toUnit]!;
    setState(() {
      _result = input * (toRate / fromRate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pengonversi Satuan")),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: _selectedCategory,
              items: unitConversions.keys.map((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  _selectedCategory = value!;
                  _fromUnit = unitConversions[_selectedCategory]!.keys.first;
                  _toUnit = unitConversions[_selectedCategory]!.keys.last;
                });
              },
            ),
            TextField(
              controller: _inputController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Input"),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  value: _fromUnit,
                  items: unitConversions[_selectedCategory]!.keys.map((String unit) {
                    return DropdownMenuItem<String>(
                      value: unit,
                      child: Text(unit),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _fromUnit = value!;
                    });
                  },
                ),
                const Icon(Icons.arrow_forward),
                DropdownButton<String>(
                  value: _toUnit,
                  items: unitConversions[_selectedCategory]!.keys.map((String unit) {
                    return DropdownMenuItem<String>(
                      value: unit,
                      child: Text(unit),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _toUnit = value!;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convert,
              child: const Text("Konversi"),
            ),
            const SizedBox(height: 20),
            if (_result != null)
              Text(
                "Hasil: ${_result!.toStringAsFixed(2)} $_toUnit",
                style: const TextStyle(fontSize: 24),
              ),
          ],
        ),
      ),
    );
  }
}
