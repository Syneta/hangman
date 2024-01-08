//import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hangman/hangman.dart';
//import 'package:hangman/data/words.dart';
//import 'package:hangman/loss_screen.dart';
//import 'package:hangman/hangman.dart';
import 'package:hangman/on_screen_keyboard.dart';
import 'package:hangman/welcome_screen.dart';
//import 'package:hangman/win_screen.dart';

const welcomeRoute = '/home';
const gameRoute = '/game';
const lossRoute = '/loss';
const winRoute = '/win';

class MainUi extends StatefulWidget {
  const MainUi({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainUiState();
  }
}

class _MainUiState extends State<MainUi> {
  String activeScreen = 'welcome-screen';

  void _nextScreen() {
    setState(() {
      activeScreen = 'game-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = WelcomeScreen(startGame: _nextScreen);

    if (activeScreen == 'game-screen') {
      screenWidget = const HangmanGame();
    }
    
    /*if (activeScreen == 'winner') {
      screenWidget = WinScreen();
    }*/

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hangman'),
        ),
        body: Column(
          children: [
            screenWidget,
          ],
        ),
      ),
    );
  }
}
