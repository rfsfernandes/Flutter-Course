import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';


class IconContent extends StatelessWidget {
  final String contentText;
  final FaIcon contentFaIcon;
  final Color contentColor;

  IconContent({@required this.contentText,
    @required this.contentFaIcon,
    @required this.contentColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: contentFaIcon,
          iconSize: 80,
          color: contentColor,
          onPressed: null,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          contentText,
          style: labelTextStyle,
        )
      ],
    );
  }
}
