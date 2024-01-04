import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hangman/data/words.dart';
//import 'package:hangman/hangman.dart';
import 'package:hangman/on_screen_keyboard.dart';

final random = Random();

class MainUi extends StatelessWidget {
  MainUi({super.key});
  
  int ran = random.nextInt(6);
 /*
  String getWord(List<String> wordList) {
    String word = wordList[random.nextInt(wordList.length)];
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

  late String hangmanWord = getWord(wordList);
  late String hiddenWord = hideWord(hangmanWord);
*/
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hangman'),
        ),
        body: Column(
          children: [
            const Keyboard(),
          ],
        ),
      ),
    );
  }
}
