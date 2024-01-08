import 'package:flutter/material.dart';
//import 'package:hangman/data/words.dart';
//import 'package:hangman/welcome_screen.dart';
//import 'package:hangman/word_generator.dart';
//import 'main_ui.dart';

class LossScreen extends StatelessWidget {
  const LossScreen({
    super.key,
    required this.word,
  });

  final String word;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loser :( '),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/images/hangman-6.png',
              width: double.infinity,
            ),
            Text(
              'The word is:\n $word',
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            TextButton.icon(
              onPressed: () {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.pop(context);
                });
              },
              icon: const Icon(Icons.restart_alt),
              label: const Text('Aftur'),
            ),
          ],
        ),
      ),
    );
  }
}
