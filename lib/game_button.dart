import 'package:flutter/material.dart';

class GameButton {
  // ignore: prefer_typing_uninitialized_variables
  final id;
  String text;
  Color bg;
  bool enabled;

  GameButton({
    this.id,
    this.text = " ",
    this.bg = Colors.brown,
    this.enabled = true,
  });
}
