import 'package:flutter/material.dart';
import 'package:hangman/data/words.dart';
import 'package:hangman/word_generator.dart';

class HangmanGame extends StatefulWidget {
  const HangmanGame({super.key});

  @override
  State<HangmanGame> createState() {
    return _HangmanGameState();
  }
}

class _HangmanGameState extends State<HangmanGame> {
  int wrongGuesses = 0;
  int remainingGuesses = 6;

  final List<String> _alphabet = 'AÁBDÐEÉFGHIÍJKLMNOÓPRSTUÚVXYÝÞÆÖ'.split('');
  Set<String> _chosenCharacter = {};
  List<String> _wrongCharacter = [];

  late String hangmanWord = getWord(wordList);
  late List hiddenWord = hideWord(hangmanWord);

  void onRestartGame() {
    setState(() {
      hangmanWord = getWord(wordList);
      hiddenWord = hideWord(hangmanWord);
      _chosenCharacter = {};
      _wrongCharacter = [];
      wrongGuesses = 0;
      remainingGuesses = 6;
    });
  }

  void _onCharTap(String char) {
    setState(() {
      _chosenCharacter.add(char.toUpperCase());

      if (hangmanWord.contains(char.toUpperCase())) {
        for (int i = 0; i < hangmanWord.length; i++) {
          if (hangmanWord[i] == char) {
            hiddenWord[i] = char;
          }
        }
      } else {
        wrongGuesses++;
        remainingGuesses--;
        _wrongCharacter.add(char.toUpperCase());
      }
    });
  }

  void lossScreen(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return LossScreen(
        word: hangmanWord,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    if (wrongGuesses == 6) {
      Future.delayed(Duration.zero, () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Tapari'),
              content: Text('Því miður ertu tapari\nRétt orð: $hangmanWord'),
              actions: <Widget>[
                OutlinedButton(
                  child: const Text('Aftur'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    onRestartGame();
                  },
                ),
              ],
            );
          },
        );
      });
    }
    if (hiddenWord.join('').toUpperCase() == hangmanWord.toUpperCase()) {
      Future.delayed(Duration.zero, () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Sigurvegari'),
              content: const Text('Rétt, þú vinnur'),
              actions: <Widget>[
                OutlinedButton(
                  child: const Text('Aftur'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    onRestartGame();
                  },
                ),
              ],
            );
          },
        );
      });

      /*Navigator.of(context).push(MaterialPageRoute(builder: (_) {

        return WinScreen(onPop: () {
          Navigator.pop(context);
        });
      }));*/
    }
    return Column(
      children: [
        Image.asset(
          'assets/images/hangman-$wrongGuesses.png',
          width: 400,
        ),
        const SizedBox(height: 10),
        Text(
          hiddenWord.join(' '),
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
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
        Text(
          'Tilraunir eftir: $remainingGuesses \nRangir Stafir:${_wrongCharacter.join(', ')}',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}





/*

import 'dart:math';

import 'package:flutter/material.dart';
import 'data/words.dart';
import 'package:hangman/on_screen_keyboard.dart';

class Hangman extends StatefulWidget {
  const Hangman({super.key});
  

  @override
  State<StatefulWidget> createState() {
    return _HangmanState();
  }
}

class _HangmanState extends State<Hangman> {
  int wrongGuesses = 0;

  String getWord(List<String> listOfWords) {
    final random = Random();
    String word = listOfWords[random.nextInt(wordList.length)];
    return word;
  }

  String hideWord(String word) {
    int wordLength = word.length;
    String hiddenWord = '';
    for (int i = 0; i < wordLength; i++) {
      hiddenWord = '_ ' * wordLength;
    }
    return hiddenWord;
  }

  @override
  Widget build(BuildContext context) {
    String word = getWord(wordList);
    hideWord(word);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hangman'),
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/images/hangman-$numberOfGuesses',
            width: 200,
          ),
          const SizedBox(height: 20),
          Text(word),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
*/