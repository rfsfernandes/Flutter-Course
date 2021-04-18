import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void play(int number) async {
      final player = AudioCache();
      player.play("note$number.wav");
    }

    Expanded buildKey({int keyNumber, Color color}) {
      return Expanded(
        flex: 1,
        // ignore: deprecated_member_use
        child: FlatButton(
          color: color,
          onPressed: () => play(keyNumber),
          child: null,
        ),
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildKey(keyNumber: 1, color: Colors.red),
                buildKey(keyNumber: 2, color: Colors.orange),
                buildKey(keyNumber: 3, color: Colors.yellow),
                buildKey(keyNumber: 4, color: Colors.green),
                buildKey(keyNumber: 5, color: Colors.teal),
                buildKey(keyNumber: 6, color: Colors.blue),
                buildKey(keyNumber: 7, color: Colors.purple),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
