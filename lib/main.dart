import 'package:flutter/material.dart';
import 'screen/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF000000),
        scaffoldBackgroundColor: Color(0xFF000000),

      ),
      home: InputPage(),
    );
  }
}

