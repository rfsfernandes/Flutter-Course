import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class IncrementerWidget extends StatelessWidget {
  final Function onButtonClick;
  final String contentValue;
  final String title;

  IncrementerWidget(
      {@required this.onButtonClick,
      @required this.contentValue,
      @required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          title,
          style: labelTextStyle,
        ),
        Text(
          contentValue,
          style: numbersStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            FloatingActionButton(
              backgroundColor: Color(0xFF111428),
              onPressed: () => onButtonClick(Operation.Subtract),
              child: Icon(
                Icons.remove,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              backgroundColor: Color(0xFF111428),
              onPressed: () => onButtonClick(Operation.Add),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
