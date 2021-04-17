import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int random1 = 1;
  int random2 = 1;

  @override
  Widget build(BuildContext context) {

    void buttonsClicked() {
      setState(() {
        random1 = Random().nextInt(6) + 1;
        random2 = Random().nextInt(6) + 1;
      });
    }

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: InkWell(
                onTap: () => buttonsClicked(),
                child: Image.asset("images/dice$random1.png"),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: InkWell(
                onTap: () => buttonsClicked(),
                child: Image.asset("images/dice$random2.png"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}