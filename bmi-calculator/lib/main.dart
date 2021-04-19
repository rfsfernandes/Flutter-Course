import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        accentColor: Colors.orange.shade400,
        scaffoldBackgroundColor: Color(0xFF0A0D22),
        sliderTheme: SliderThemeData(
            trackHeight: 1,
            inactiveTrackColor: textColor,
            activeTrackColor: Colors.white,
            thumbColor: buttonContainerColor,
            thumbShape: RoundSliderThumbShape(
              enabledThumbRadius: 15.0,
            ),
            overlayShape: RoundSliderOverlayShape(
              overlayRadius: 30.0,
            ),
            overlayColor: sliderOverlayColor
        ),
      ),
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        '/result': (context) => ResultsPage()
      },
    );
  }
}


