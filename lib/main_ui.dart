import 'package:flutter/material.dart';
import 'package:hangman/hangman.dart';
import 'package:hangman/welcome_screen.dart';

/*
The main ui is where we control the screens, 
welcome screen on the load up and after that the game screen
Here is also where the background is controlled.
*/
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

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hengimann'),
          backgroundColor: Colors.black54,
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(205, 205, 205, 1),
                Color.fromRGBO(163, 162, 163, 1),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              screenWidget,
            ],
          ),
        ),
      ),
    );
  }
}
