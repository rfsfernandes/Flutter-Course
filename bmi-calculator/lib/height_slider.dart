import 'package:flutter/material.dart';

import 'constants.dart';

class HeightSlider extends StatelessWidget {

  final double sliderValue;
  final Function onSlideChange;
  String userHeight;
  HeightSlider({@required this.sliderValue, @required this.onSlideChange}) {
    userHeight = this.sliderValue.round().toString();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "HEIGHT",
          style: labelTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              userHeight,
              style: numbersStyle,
            ),
            Text(
              "cm",
              style: TextStyle(
                fontSize: 18,
                color: labelTextStyle.color,
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
        Slider(
          value: sliderValue,
          onChanged: (double value) => onSlideChange(value),
          max: sliderMax,
          min: sliderMin,
        ),
      ],
    );
  }

}