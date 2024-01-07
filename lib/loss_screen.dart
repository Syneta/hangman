import 'package:flutter/material.dart';
import 'package:hangman/data/words.dart';
import 'package:hangman/word_generator.dart';

class LossScreen extends StatelessWidget {
  LossScreen({super.key, required this.onRestart});

  final void Function() onRestart;

  @override
  String showWord = getWord(wordList);

  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(50),
        child: Column(children: [
          Image.asset(
            'assets/images/hangman-6.png',
            width: double.infinity,
          ),
          Text(
            'The word is:\n $showWord',
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ]),
      ),
    );
  }
}
