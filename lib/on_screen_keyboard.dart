import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hangman/data/words.dart';

Random random = Random();

class Keyboard extends StatefulWidget {
  const Keyboard({super.key});

  @override
  State<Keyboard> createState() => _KeyboardState();
}

class _KeyboardState extends State<Keyboard> {
  int wrongGuesses = 0;

  final List<String> _alphabet = 'AÁBDÐEÉFGHIÍJKLMNOÓPRSTUÚVXYÝÞÆÖ'.split('');
  final Set<String> _chosenCharacter = {};

  String _getWord(List<String> words) {
    String word = words[random.nextInt(words.length)];
    return word;
  }

  String _hideWord(String word) {
    int wordLength = word.length;
    String hiddenWord = '';
    for (int i = 0; i < wordLength; i++) {
      hiddenWord = '_ ' * wordLength;
    }
    return hiddenWord;
  }

  late final String _hangmanWord = _getWord(wordList);
  late String _hiddenWord = _hideWord(_hangmanWord);

  void _onCharTap(String char) {
    setState(() {
      _chosenCharacter.add(char);

      if (_hangmanWord.contains(char.toUpperCase())) {
        for (int i = 0; i < _hangmanWord.length; i++) {
          if (_hangmanWord[i] == char) {
            _hiddenWord = _hiddenWord.replaceRange(i * 2, i * 2 + 1,
                char); // use i * 2 as the start index and i * 2 + 1 as the end index
          }
        }
      } else {
        wrongGuesses++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
