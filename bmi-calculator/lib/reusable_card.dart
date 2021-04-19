import 'package:flutter/material.dart';

import 'input_page.dart';

class ReusableCard extends StatelessWidget {
  final Widget cardChild;
  final Color bgColor;
  final Function onClick;

  ReusableCard({this.cardChild, @required this.bgColor, this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: bgColor,
        ),
        child: cardChild,
      ),
    );
  }
}
