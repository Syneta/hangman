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
  int numberOfGuesses = 0;

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