import 'package:flutter/material.dart';
import 'package:hangman/data/words.dart';

class Keyboard extends StatefulWidget {
  const Keyboard({super.key});

  @override
  State<Keyboard> createState() => _KeyboardState();
}

class _KeyboardState extends State<Keyboard> {
  int wrongGuesses = 0;

  final List<String> _alphabet = 'AÁBDÐEÉFGHIÍJKLMNOÓPRSTUÚVXYÝÞÆÖ'.split('');
  final Set<String> _chosenCharacter = {};

  void _onCharTap(String char) {
    setState(() {
      _chosenCharacter.add(char);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
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
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
