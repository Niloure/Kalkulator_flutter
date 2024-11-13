import 'package:flutter/material.dart';
import 'calculator_screen.dart';
import 'bmi_screen.dart';
import 'currency_converter_screen.dart';
import 'unit_converter_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    CalculatorScreen(),
    BMIScreen(),
    CurrencyConverterScreen(),
    UnitConverterScreen(),  // Tambahkan halaman konversi satuan di sini
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFBFAE8B), // Background cream gelap
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Color(0xFFBFAE8B), // Latar belakang BottomNavigationBar cream gelap
        selectedItemColor: Colors.white, // Warna ikon yang dipilih (putih)
        unselectedItemColor: Colors.black87, // Warna ikon yang tidak dipilih (hitam gelap)
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.calculate), label: "Kalkulator"),
          BottomNavigationBarItem(icon: Icon(Icons.fitness_center), label: "BMI"),
          BottomNavigationBarItem(icon: Icon(Icons.attach_money), label: "Mata Uang"),
          BottomNavigationBarItem(icon: Icon(Icons.swap_horiz), label: "Konversi Satuan"),
        ],
      ),
    );
  }
}
