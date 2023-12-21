import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hangman/data/words.dart';

class Keyboard extends StatefulWidget {
  Keyboard({super.key});

  @override
  State<Keyboard> createState() => _KeyboardState();
}

class _KeyboardState extends State<Keyboard> {
  int wrongGuesses = 0;

  final List<String> _alphabet = 'AÁBDÐEÉFGHIÍJKLMNOÓPRSTUÚVXYÝÞÆÖ'.split('');
  final Set<String> _chosenCharacter = {};

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

  void _onCharTap(String char) {
    setState(() {
      _chosenCharacter.add(char);
    });
    bool rightChar = false;
    String word = 'nammi';
    int wrongGuesses = 0;
    List<bool> guessedLetters = 

    for(int i = 0; i < word.length; i++){
      if(word[i] == char){

      }
    }

  }
    String word = getWord(wordList);
    hideWord(word);
    bool isCharInWord = word.contains(char);
    for (int i = 0; i < word.length; i++) {
      if (isCharInWord = false) {
        wrongGuesses += 1;
      } else if (isCharInWord = true) {}
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Hangman'),
        ),
        body: GridView.count(
          crossAxisCount: 8,
          children: _alphabet.map((char) {
            final bool isUsed = _chosenCharacter.contains(char);
            return GestureDetector(
              onTap: isUsed ? null : () => _onCharTap(char),
              child: Container(
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: isUsed ? Colors.red : Colors.blueGrey,
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            );
          }).toList(),
        ),
      );
    }
  }
}
