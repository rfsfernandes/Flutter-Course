import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Color(int.parse("0xffE6F5FF")),
        appBar: AppBar(
          backgroundColor: Color(int.parse("0xffE63336")),
          title: Text("I'm sooooo pooooooor"),
        ),
        body: Center(
          child: Image(
            image: AssetImage("images/cherry-searching-1.png"),
          ),
        ),
      ),
    )
  );
}
