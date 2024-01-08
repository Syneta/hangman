import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hangman/data/words.dart';
//import 'package:hangman/welcome_screen.dart';
import 'package:hangman/word_generator.dart';
//import 'package:hangman/win_screen.dart';
import 'package:hangman/loss_screen.dart';
import 'package:hangman/main_ui.dart';

Random random = Random();

const welcomeRoute = '/home';
const gameRoute = '/game';
const lossRoute = '/loss';
const winRoute = '/win';

class Keyboard extends StatefulWidget {
  const Keyboard({super.key});

  @override
  State<Keyboard> createState() => _KeyboardState();
}

class _KeyboardState extends State<Keyboard> {
  int wrongGuesses = 0;

  final List<String> _alphabet = 'AÁBDÐEÉFGHIÍJKLMNOÓPRSTUÚVXYÝÞÆÖ'.split('');
  final Set<String> _chosenCharacter = {};

  late final String _hangmanWord = getWord(wordList);
  late String _hiddenWord = hideWord(_hangmanWord);

  void _onCharTap(String char) {
    setState(() {
      _chosenCharacter.add(char);

      if (_hangmanWord.contains(char.toUpperCase())) {
        for (int i = 0; i < _hangmanWord.length; i++) {
          if (_hangmanWord[i] == char) {
            _hiddenWord = _hiddenWord.replaceRange(i * 2, i * 2 + 1, char);
          }
        }
      } else {
        wrongGuesses++;
      }
    });
  }

  void tryAgain() {
    setState(() {
      wrongGuesses = 0;
    });
  }

  void mainUI(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return const MainUi();
    }));
  }
/*
  void winScreen(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return WinScreen(onRestart: tryAgain);
    }));
  }
*/
  void lossScreen(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return LossScreen(
        word: _hangmanWord,
      );
    }));
  }

/*
  void popScreen(BuildContext ctx) {
    void popScreen(BuildContext ctx) {
      Navigator.pop(ctx);
      Navigator.popUntil(
          ctx,
          (route) => route
              is KeyboardRoute); // Use the type of the route that shows the Keyboard widget
    }
  }
*/
  @override
  Widget build(BuildContext context) {
    if (wrongGuesses == 6) {
      lossScreen(context);
    }
    if (_hangmanWord == _hiddenWord) {
      Navigator.pushNamed(context, winRoute);
    }

    return Column(
      children: [
        Image.asset(
          'assets/images/hangman-$wrongGuesses.png',
          width: 300,
        ),
        const SizedBox(height: 20),
        Text(
          _hiddenWord,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        GridView.count(
          crossAxisCount: 8,
          shrinkWrap: true,
          children: _alphabet.map((char) {
            final bool isUsed = _chosenCharacter.contains(char);
            return GestureDetector(
              onTap: isUsed ? null : () => _onCharTap(char),
              child: Container(
                margin: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: isUsed ? Colors.grey : Colors.blue,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Center(
                  child: Text(
                    char,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
