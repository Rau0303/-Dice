import 'package:flutter/material.dart';
import 'package:my_game_dice/screens/homePage.dart';

void main() {
  runApp( MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => home(),
    },
  ));
}
