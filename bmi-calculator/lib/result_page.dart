import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final Map<String, Object> args = ModalRoute.of(context).settings.arguments;
    double bmiResult = args['result'];
    String resultText = "";
    Color resultColor = Colors.white;

    if(bmiResult < 18.5 ) {
      resultText = "Underweight";
      resultColor = Colors.green.shade300;
    } else if (bmiResult >= 18.5 && bmiResult < 25) {
      resultText = "Normal";
      resultColor = Colors.green;
    } else if (bmiResult >= 25 && bmiResult < 30) {
      resultText = "Overweight";
      resultColor = Colors.yellow;
    } else if (bmiResult >= 30 && bmiResult < 40) {
      resultText = "Obesity";
      resultColor = Colors.orange;
    } else {
      resultText = "Morbid Obesity";
      resultColor = Colors.red.shade700;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  "Your results",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 40),
                ),
              )),
          Expanded(
            flex: 13,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ReusableCard(
                bgColor: activeCardColor,
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      resultText,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        color: resultColor,
                      ),
                    ),
                    Text(
                      bmiResult.toStringAsFixed(1),
                      style: TextStyle(
                        fontSize: 90,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "Nice body weight!",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context, '/result');
              },
              child: Container(
                color: buttonContainerColor,
                child: Center(
                  child: Text(
                    'RECALCULATE',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
