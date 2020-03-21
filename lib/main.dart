import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final player = AudioCache();

  void playSound(buttonNum) {
    player.fixedPlayer.onPlayerCompletion;
    player.play('note$buttonNum.wav').then(print);
  }

  Color getColor(int buttonNum) {
    return Colors.orange[(8 - buttonNum) * 100];
  }

  Widget makeButton(int buttonNum, {Color color}) {
    if (color == null) {
      color = getColor(buttonNum);
    }
    return Expanded(
      child: FlatButton(
        color: color,
        onPressed: () => playSound(buttonNum),
        child: Text(
          nouns.getRange(buttonNum, buttonNum + 1).first,
          style: TextStyle(fontSize: 14),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Xylophone App"),
          backgroundColor: Colors.indigo,
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              makeButton(1, color: Colors.red),
              makeButton(2),
              makeButton(3),
              makeButton(4),
              makeButton(5),
              makeButton(6),
              makeButton(7),
            ],
          ),
        ),
      ),
    );
  }
}
