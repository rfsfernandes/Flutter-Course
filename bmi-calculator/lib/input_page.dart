import 'dart:math';

import 'package:bmi_calculator/height_slider.dart';
import 'package:bmi_calculator/incrementer_widget.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';
import 'icon_content.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { Male, Female }
enum Operation { Add, Subtract }

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.Male;
  double sliderValue = 150;
  int weight = 50;
  int age = 18;

  void updateSelection(Gender genderClicked) {
    setState(() {
      selectedGender = genderClicked;
    });
  }

  void onSlideChange(double value) {
    setState(() {
      sliderValue = value;
    });
  }

  void updateWeight(Operation operation) {
    setState(() {
      switch (operation) {
        case Operation.Add:
          weight++;
          break;
        case Operation.Subtract:
          weight--;
          break;
      }
    });
  }

  void updateAge(Operation operation) {
    setState(() {
      switch (operation) {
        case Operation.Add:
          age++;
          break;
        case Operation.Subtract:
          age--;
          break;
      }
    });
  }

  void calculateBmi(){
    double result = weight / pow(sliderValue.round() / 100, 2);

    Navigator.pushNamed(context, '/result', arguments: {'result': result});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: ReusableCard(
                      bgColor: selectedGender == Gender.Male
                          ? activeCardColor
                          : inactiveCardColor,
                      cardChild: IconContent(
                        contentColor: Colors.white60,
                        contentFaIcon: FaIcon(FontAwesomeIcons.mars),
                        contentText: "MALE",
                      ),
                      onClick: () => updateSelection(Gender.Male),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: ReusableCard(
                      bgColor: selectedGender == Gender.Female
                          ? activeCardColor
                          : inactiveCardColor,
                      cardChild: IconContent(
                        contentColor: Colors.white60,
                        contentFaIcon: FaIcon(FontAwesomeIcons.venus),
                        contentText: "FEMALE",
                      ),
                      onClick: () => updateSelection(Gender.Female),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: ReusableCard(
                bgColor: activeCardColor,
                cardChild: HeightSlider(
                  sliderValue: sliderValue,
                  onSlideChange: onSlideChange,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: ReusableCard(
                      bgColor: activeCardColor,
                      cardChild: IncrementerWidget(
                        contentValue: weight.toString(),
                        onButtonClick: updateWeight,
                        title: 'WEIGHT',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: ReusableCard(
                      bgColor: activeCardColor,
                      cardChild: IncrementerWidget(
                        contentValue: age.toString(),
                        onButtonClick: updateAge,
                        title: 'AGE',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () {
                calculateBmi();
              },
              child: Container(
                color: buttonContainerColor,
                child: Center(
                  child: Text(
                    'CALCULATE YOUR BMI',
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
