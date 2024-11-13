import 'package:flutter/material.dart';

class CurrencyConverterScreen extends StatefulWidget {
  const CurrencyConverterScreen({Key? key}) : super(key: key);

  @override
  State<CurrencyConverterScreen> createState() => _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {
  final TextEditingController _amountController = TextEditingController();
  String _fromCurrency = "IDR";
  String _toCurrency = "USD";
  double? _result;

  final Map<String, double> exchangeRates = {
    "IDR": 1,
    "USD": 0.000065,
    "EUR": 0.000057,
  };

  void _convert() {
    double amount = double.parse(_amountController.text);
    double fromRate = exchangeRates[_fromCurrency]!;
    double toRate = exchangeRates[_toCurrency]!;
    setState(() {
      _result = amount * (toRate / fromRate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kalkulator Mata Uang")),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Jumlah"),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  value: _fromCurrency,
                  items: exchangeRates.keys.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _fromCurrency = value!;
                    });
                  },
                ),
                const Icon(Icons.arrow_forward),
                DropdownButton<String>(
                  value: _toCurrency,
                  items: exchangeRates.keys.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _toCurrency = value!;
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
              Text("Hasil: ${_result!.toStringAsFixed(2)} $_toCurrency",
                  style: const TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
